Steps:
Copy the foler "Working_Deliver/internalLoadBalancer" to your vm where terraform can run.
Go into the folder "internalLoadBalancer".
The edit the file "internalLoadBalancer/loadbalancer/variables.tf", then update the following variables with appropriate value as per your requirement.
	project
	region
	zone
	name
If you want to create the LB on top of your specific VPC then you can update the vpc name in the variable called "network"
Then you can run the terraform init/plan/apply one by one.



