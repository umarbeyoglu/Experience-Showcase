from http.client import HTTPResponse
from django.shortcuts import render
import pandas as pd
import os
from django.core.files.storage import FileSystemStorage
from .models import Employee
from tablib import Dataset
from import_export import resources
from .models import Employee
 
class EmployeeResource(resources.ModelResource):
    class Meta:
        model = Employee

def Import_Excel_pandas(request):
     
    if request.method == 'POST' and request.FILES['myfile']:      
        myfile = request.FILES['myfile']
        fs = FileSystemStorage()
        filename = fs.save(myfile.name, myfile)
        uploaded_file_url = fs.url(filename)              
        empexceldata = pd.read_excel(filename)        
        dbframe = empexceldata
        for dbframe in dbframe.itertuples():
            obj = Employee.objects.create(Empcode=dbframe.Empcode,firstName=dbframe.firstName, middleName=dbframe.middleName,
                                            lastName=dbframe.lastName, email=dbframe.email, phoneNo=dbframe.phoneNo, address=dbframe.address,
                                            gender=dbframe.gender, DOB=dbframe.DOB,salary=dbframe.salary )           
            obj.save()
        return render(request, 'import_excel_db.html', {
            'uploaded_file_url': uploaded_file_url
        })   
    return render(request, 'import_excel_db.html',{})
