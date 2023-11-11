<VirtualHost *:80>	
    DocumentRoot "C:\xampp\htdocs\chatbot_ct467" 
    ServerName chatbot467.localhost
    # Set access permission 
    <Directory "C:\xampp\htdocs\chatbot_ct467" > 
	Options Indexes FollowSymLinks Includes ExecCGI
	AllowOverride All
	Require all granted
    </Directory>
</VirtualHost>
