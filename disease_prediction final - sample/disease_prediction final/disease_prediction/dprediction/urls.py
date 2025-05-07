from django.urls import path

from dprediction import views

urlpatterns=[
    path('',views.main),
    path('login',views.login),
    path('hospital_reg',views.hospital_reg),
    path('hospital_reg_post',views.hospital_reg_post),
    path('adminpage',views.adminpage),
    path('view_approved_hosp',views.view_approved_hosp),
    path('view_hosp',views.view_hosp),
    path('accept/<id>',views.accept),
    path('reject/<id>',views.reject),
    path('hospitalindex',views.hospitalindex),
    path('aboutus', views.aboutus),
    path('contactus', views.contactus),
    path('patient_reg',views.patient_reg),
    path('patient_reg_post',views.patient_reg_post),
    path('hos_view_patients',views.hos_view_patients),
    path('addinfo/<pid>',views.addinfo),
    path('addinfo_post',views.addinfo_post),
    path('complaint_reply',views.complaint_reply),
    path('sendreply/<id>', views.sendreply),
    path('send_reply_post', views.send_reply_post),
    path('feedback', views.feedback),
    path('viewuser', views.viewuser),
    path('complaint_date_search_post', views.complaint_date_search_post),
    path('feedback_date_search_post', views.feedback_date_search_post),
    path('feedback_date_search_post', views.feedback_date_search_post),
    path('viewuser_name_search_post', views.viewuser_name_search_post),
    path('/viewdatamap', views.viewdatamap),
    path('user_view_disease_report', views.user_view_disease_report),

    path('viewdata', views.viewdata),
    path('login_app', views.login_app),
    path('view_details', views.view_details),

    # path('')
    ]