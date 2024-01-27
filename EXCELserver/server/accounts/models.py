from django.db import models


class Employee(models.Model):       
    Empcode = models.CharField(max_length=20, default='')
    firstName = models.CharField(max_length=150,null=True)
    middleName = models.CharField(max_length=100,null=True)    
    lastName = models.CharField(max_length=100,null=True)
    email = models.CharField(max_length=30,null=True)
    phoneNo = models.CharField(max_length=42, default='',null=True)
    address = models.CharField(max_length=500, default='',null=True)     
    DOB = models.DateField(null=True, blank=True)   
    gender = models.CharField(max_length=25, default='',null=True)
    qualification = models.CharField(max_length=50,default='',null=True) 
    salary = models.FloatField(max_length=50,default='',null=True)   
     
    def __str__(self):
        return self.firstName
                 
    objects = models.Manager()
