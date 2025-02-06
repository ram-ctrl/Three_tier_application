##How the Architecture Works##
Frontend (Public EC2):<br>

Hosts the React app and serves it via Nginx. <br>
Proxies API requests to the backend (private EC2). <br>
Backend (Private EC2):<br>

Runs the backend app (e.g., Express.js, Django, Flask).
Retrieves database credentials from environment variables.
Connects to RDS PostgreSQL via its private IP.
Database (RDS PostgreSQL):

Runs inside a private subnet (not publicly accessible).
Allows connections only from the backend security group.<br>

##Security Best Practices Applied##<br>
✅ Database Credentials Not Hardcoded:<br>

Uses AWS Secrets Manager to store passwords securely.<br>
✅ Backend is in Private Subnet:<br>

Backend has no public IP, preventing external access.<br>
✅ Frontend Uses Nginx as Reverse Proxy:<br>

Securely routes API requests to the backend.<br>
✅ RDS is in a Private Subnet:<br>

Accessible only from the backend (not exposed to the internet).<br>

##Final Summary##<br>

Frontend (public subnet) serves the UI and forwards API calls to Backend.<br>
Backend (private subnet) retrieves DB credentials and connects to RDS.<br>
RDS (private subnet) is secured, allowing only backend connections.<br>
AWS Secrets Manager protects sensitive credentials.
