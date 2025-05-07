from datetime import datetime
from django.db.models import Count
import numpy as np
import pandas as pd
from django.core.files.storage import FileSystemStorage
from django.http.response import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
from .models import *
from .loc_function import get_lat_lon_google
# Create your views here.
from .forecasting_code import forecast_function
def main(request):
    import csv

    # Open CSV file
    # with open(r"C:\Users\kpriy\Downloads\archive (1)\time-series-19-covid-combined.csv", 'r') as file:
    #     reader = csv.reader(file)
    #     for row in reader:
    #         print(row)
    #         obu=patient_table.objects.get(id=1)
    #         try:
    #             for i in range(int(row[5])):
    #                 ob=report_table()
    #                 ob.PATIENT = obu
    #                 ob.disease = 'corona'
    #                 ob.report = 'sample'
    #                 ob.prescription = 'sample'
    #                 ob.date=row[0]
    #                 ob.save()
    #         except Exception as e:
    #             print(e)
    return render(request,'index.html')

# def signup(request):
#     uname=
def login(request):
    uname=request.POST['username']
    password=request.POST['pass']
    try:
        ob=login_table.objects.get(username=uname,password=password)
        request.session["lid"]=ob.id
        if ob.type == 'admin':
            return  redirect('/adminpage')
        elif ob.type == 'hospital':
            return  redirect("/hospitalindex")
        else:
            return HttpResponse('''<script>alert('Invalid Username and Password');window.location="/"</script>''')
    except:
            return HttpResponse('''<script>alert('Invalid Username and Password');window.location="/"</script>''')

def adminpage(request):
    ob=report_table.objects.all().order_by("date")
    dates=[]
    for i in ob:
        if i.date not in dates:
            dates.append(i.date)
    dataset=[]
    for i in dates:
        ob=report_table.objects.filter(date=i)
        dataset.append({"Date":i,"Value":len(ob)})

    import csv

    # with open('dataset.csv', 'w', newline='') as csvfile:
    #     fieldnames = ['Date', 'Value']
    #     writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    #     writer.writeheader()
    #     writer.writerows(dataset)
    original,predicted=forecast_function()
    return render(request,'adminindex.html',{"o":original,"p":predicted})

def hospital_reg(request):
    return render(request,'regindex.html')


def hospital_reg_post(request):
    name=request.POST['name']
    logo=request.FILES['logo']
    place = request.POST['place']
    post = request.POST['post']
    pin = request.POST['pin']
    phone_no = request.POST['phone_no']
    email = request.POST['email']
    username = request.POST['username']
    password = request.POST['password']

    if login_table.objects.filter(username=username).exists():
        return HttpResponse('''<script>alert('User Name Already Exists');window.location="/"</script>''')

    fs=FileSystemStorage()
    date=datetime.now().strftime("%Y-%m-%d-%H-%M-%S")+'.jpg'
    fs.save(date,logo)
    path=fs.url(date)

    c=login_table()
    c.username=username
    c.password=password
    c.type='pending'
    c.save()


    a=hospital_table()
    a.LOGIN=c
    a.name=name
    a.logo=logo
    a.place=place
    a.post=post
    a.pin=pin
    a.phone_no=phone_no
    a.email=email
    a.username=username
    a.password=password
    a.save()
    return HttpResponse('''<script>alert('successfully registerd');window.location="/"</script>''')

def view_hosp(request):
    ob=hospital_table.objects.filter(LOGIN__type='pending')
    return render(request, 'admin/view_hosp.html',{"val":ob})


def view_approved_hosp(request):
    ob=hospital_table.objects.exclude(LOGIN__type='pending')
    return render(request, 'admin/view_approved_hosp.html',{"val":ob})


def accept(request,id):
    ob=login_table.objects.get(id=id)
    ob.type='hospital'
    ob.save()
    return HttpResponse('''<script>alert('Accepted');window.location="/view_hosp"</script>''')

def reject(request,id):
    ob = login_table.objects.get(id=id)
    ob.type = 'hospital'
    ob.delete()
    return HttpResponse('''<script>alert('Rejected');window.location="/view_hosp"</script>''')

def hospitalindex(request):
    return render(request,'hospital/Hospital_Home.html')

def aboutus(request):
    return render(request,'aboutus.html')

def contactus(request):
    return render(request,'contactus.html')





def patient_reg(request):
    return render(request,'hospital/patientdetails.html')

def patient_reg_post(request):
    name=request.POST['name']
    dob=request.POST['dob']
    gen = request.POST['gen']
    phone_no = request.POST['phone_no']
    place = request.POST['place']
    pin = request.POST['pin']
    post = request.POST['post']

    a = patient_table()
    a.name = name
    a.gender = gen
    a.place = place
    a.post = post
    a.pin = pin
    a.phone = phone_no
    a.dob = dob
    a.HOSPITAL= hospital_table.objects.get(LOGIN=request.session["lid"])

    a.save()
    # return HttpResponse('''<script>alert('successfully registerd);window.location="/"</script>''')
    return HttpResponse('''<script>alert("success");window.location='/hospitalindex'</script>''')

def hos_view_patients(request):
    ob = patient_table.objects.filter(HOSPITAL__LOGIN=request.session["lid"])
    return render(request, 'hospital/hos_view_patients.html', {"val": ob})

def addinfo(request,pid):
    request.session["pid"]=pid
    return render(request,'hospital/addinfo.html')

def addinfo_post(request):
    disease = request.POST['disease']
    prescription = request.FILES['prescription']
    report = request.FILES['report']
    fs = FileSystemStorage()

    pre=fs.save(prescription.name, prescription)

    fs = FileSystemStorage()

    repo=fs.save(report.name, report)

    a = report_table()
    a.disease = disease
    a.report = repo
    a.prescription = pre
    a.PATIENT_id = request.session["pid"]
    a.date=datetime.today()
    a.save()

    return HttpResponse('''<script>alert("success");window.location='/hos_view_patients'</script>''')

def viewdata(request):

    print("==================================")
    d=request.GET['p']
    from django.db.models import Count
    from django.db.models.functions import TruncMonth
    from django.utils import timezone

    # Get current date
    current_date = timezone.now().date()

    # Calculate the date 12 months ago
    start_date = current_date.replace(day=1) - timezone.timedelta(days=1)
    start_date = start_date.replace(day=1)

    # Query to count diseases per month in the last 12 months
    disease_counts = (report_table.objects.filter(disease=d).annotate(month=TruncMonth('date'))
                      .values('month')
                      .annotate(disease_count=Count('id'))
                      .order_by('month'))

    # Printing the result
    dataset = []
    mnames=[]
    for entry in disease_counts:
        print(type(entry['month']))

        month_name = entry['month'].strftime('%b')
        print(month_name)
        mnames.append(month_name)
    dataset.append({"Date": entry['month'], "Value": entry['disease_count']})
    for entry in disease_counts:
        dataset.append({"Date": entry['month'], "Value": entry['disease_count']})
    for entry in disease_counts:
        dataset.append({"Date": entry['month'], "Value": entry['disease_count']})





    print("###################################")
    #
    ob=report_table.objects.all().order_by("date")
    dates=[]
    for i in ob:
        if i.date not in dates:
            dates.append(i.date)
    # dataset=[]
    # for i in dates:
    #     ob=report_table.objects.filter(date=i)
    #     dataset.append({"Date":i,"Value":len(ob)})

    import csv



    with open('dataset.csv', 'w', newline='') as csvfile:
        fieldnames = ['Date', 'Value']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(dataset)
    original,predicted=forecast_function()
    print(original,predicted)
    c=[]
    p=[]
    dlist=[]
    reslst = []
    mlist=['jan','feb','mar','apl','may','june','july','aug','sep','oct','nov','dec']
    try:
        for i in range(12):
            dlist.append({"c":original[i][0],"p":predicted[i][0],"m":mnames[i]})
            reslst.append({'x_value': mlist[i], 'y_value': float(original[i][0]),'y_value2':float(predicted[i][0])})
            c.append(original[i][0])
            p.append(predicted[i][0])
    except:
        pass
    print(mnames)


    # j = 1
    # for i in obres:
    #     m = i.score
    #     tmm = get_sum_of_marks(i.test_id.id)
    #
    #     # reslst.append(round(m/tmm,2))
    #     reslst.append({'x_value': j, 'y_value': round(m / tmm, 2) * 100})
    #     reslst.append({'x_value': j + 1, 'y_value': round(m / tmm, 2) * 100})
    #     reslst.append({'x_value': j + 2, 'y_value': round(m / tmm, 2) * 100})
    # data_list = reslst
    # print(data_list)

    # Return data as JSON
    return JsonResponse(reslst, safe=False)


    # return render(request,'upage.html',{"or":c,"pr":p,"d":dlist})

def complaint_reply(request):
    ob=complaint_table.objects.all().order_by('-id')
    return render(request, 'admin/complaint_reply.html', {"val": ob})




def complaint_date_search_post(request):
    print(request.POST,"hhhhh")
    datefrom = request.POST['from']
    tilldate = request.POST['to']
    ob = complaint_table.objects.filter(date__range=(datefrom,tilldate) ).order_by('-id')
    return render(request, 'admin/complaint_reply.html', {"val": ob})


def feedback_date_search_post(request):
    print(request.POST,"hhhhh")
    datefrom = request.POST['from']
    tilldate = request.POST['to']
    ob = feedback_table.objects.filter(date__range=(datefrom,tilldate) ).order_by('-id')
    return render(request, 'admin/feedback.html', {"val": ob})



def sendreply(request,id):
    comp = complaint_table.objects.get(id=id)
    return render(request, 'admin/sendreply.html',{'comp':comp})

def send_reply_post(request):
    id = request.POST['id']
    reply = request.POST['reply']
    comp = complaint_table.objects.get(id=id)
    comp.reply = reply
    comp.save()
    return HttpResponse('''<script>alert("Replied");window.location='/complaint_reply'</script>''')


def feedback(request):
    ob=feedback_table.objects.all().order_by('-id')
    return render(request, 'admin/feedback.html', {"val": ob})

def viewuser(request):
    ob = patient_table.objects.all()
    return render(request, 'admin/viewuser.html',{"val":ob})

def viewuser_name_search_post(request):
    name=request.POST['name']
    ob = patient_table.objects.filter(name=(name))
    return render(request, 'admin/viewuser.html', {"val": ob})




def login_app(request):
    uname=request.POST['username']
    password=request.POST['pass']
    try:
        ob=login_table.objects.get(username=uname,password=password,type='user')
        return JsonResponse({"task":"valid","lid":ob.id})
    except:
        return JsonResponse({"task": "invalid"})


def user_registration(request):
    uname=request.POST['username']
    password=request.POST['pass']
    phoneno=request.POST['phoneno']
    email=request.POST['email']
    address=request.POST['address']

    try:
        ob=login_table.objects.get(username=uname,password=password,type='user')
        return JsonResponse({"task":"valid","lid":ob.id})
    except:
        return JsonResponse({"task": "invalid"})
#
# def viewdata(request):
#     ob=report_table.object.all()
#     return render(request, 'admin/viewdata.html', {"val": ob})

def viewdatamap(request):
    ob=report_table.objects.all()
    result=[]
    for i in ob:
        try:
            loc=get_lat_lon_google(i.PATIENT.post+", "+i.PATIENT.district,)
            r={"lat":loc[0],"lng":loc[1],"title":i.disease}
            result.append(r)
            if len(result)>10:
                break
        except:
            pass
    return render(request, 'admin/gmapsample.html', {"val": result})

def user_view_disease_report(request):
    reports = report_table.objects.all()

    print(reports)

    disease_data = {}

    for report in reports:
        year = report.date.year

        print(year,"===================================")
        if year not in disease_data:
            disease_data[year] = {}

        if report.disease in disease_data[year]:
            disease_data[year][report.disease] += 1
        else:
            disease_data[year][report.disease] = 1

    total_disease_count = reports.count()
    response_data = {
        "total_disease_count": total_disease_count,
        "disease_by_year": disease_data,
    }
    print(response_data)
    return JsonResponse({"status": "ok", "data": response_data})
def  view_details(request):
    reports = report_table.objects.all()
    disdid=[]
    for i in reports:
        if i.disease not in disdid:
            disdid.append(i.disease)
    lst=[]
    for i in disdid:
        reports = report_table.objects.filter(disease=i)
        lst.append({"dis":i,"c":len(reports)})
    reports_sorted = sorted(lst, key=lambda x: x["c"], reverse=True)
    result=[]
    result.append(reports_sorted[0]['dis'])
    eports = report_table.objects.filter(disease=disdid[0],date=datetime.today())
    result.append(str(len(eports)))
    for i in reports_sorted:
        result.append(i['dis'])
    print(result)
    return JsonResponse({"task":result})

def report_systm(request):
    lid=request.GET['id']
    obres=result.objects.filter(student_id_login_id_id=lid)
    reslst=[]
    j=1
    for i in obres:
        m=i.score
        tmm=get_sum_of_marks(i.test_id.id)

        # reslst.append(round(m/tmm,2))
        reslst.append({'x_value': j, 'y_value':round(m/tmm,2)*100})
        reslst.append({'x_value': j+1, 'y_value':round(m/tmm,2)*100})
        reslst.append({'x_value': j+2, 'y_value':round(m/tmm,2)*100})
    data_list = reslst
    print(data_list)

    # Return data as JSON
    return JsonResponse(data_list, safe=False)

