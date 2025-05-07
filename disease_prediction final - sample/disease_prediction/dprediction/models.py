from django.db import models

# Create your models here.

class login_table(models.Model):
    username=models.CharField(max_length=90)
    password=models.CharField(max_length=60)
    type=models.CharField(max_length=90)

class hospital_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    name=models.CharField(max_length=90)
    logo=models.FileField()
    place=models.CharField(max_length=90)
    post=models.CharField(max_length=90)
    pin=models.BigIntegerField()
    phone_no=models.BigIntegerField()
    email=models.CharField(max_length=90)

class patient_table(models.Model):


    HOSPITAL = models.ForeignKey(hospital_table, on_delete=models.CASCADE)
    name=models.CharField(max_length=90)
    gender=models.CharField(max_length=90)
    place=models.CharField(max_length=90)
    post=models.CharField(max_length=90)
    pin=models.BigIntegerField()
    district=models.CharField(max_length=90)
    dob=models.DateField()
    phone=models.BigIntegerField()

class report_table(models.Model):

    PATIENT = models.ForeignKey(patient_table, on_delete=models.CASCADE)
    disease = models.CharField(max_length=90)
    report = models.FileField()
    prescription = models.FileField()
    date=models.DateField()


class complaint_table(models.Model):
    PATIENT=models.ForeignKey(patient_table,on_delete=models.CASCADE)

    reply = models.CharField(max_length=90)
    complaint = models.CharField(max_length=90)
    date = models.DateField()


class feedback_table(models.Model):
    PATIENT = models.ForeignKey(patient_table, on_delete=models.CASCADE)
    feedback = models.CharField(max_length=90)
    date = models.DateField()

