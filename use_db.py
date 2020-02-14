import pymysql.cursors
import mysql.connector
from mysql.connector import Error
import sshtunnel

sshtunnel.SSH_TIMEOUT = 5.0
sshtunnel.TUNNEL_TIMEOUT = 5.0

# pythonanywhere
with sshtunnel.SSHTunnelForwarder(
    ('ssh.pythonanywhere.com', 22),
    ssh_username='purplefrog', ssh_password='18051998irina',
    remote_bind_address=('purplefrog.mysql.pythonanywhere-services.com', 3306)
) as tunnel:
    # mysql database
    connection = mysql.connector.connect(
        user='purplefrog', password='irina18051998',
        host="127.0.0.1", port=tunnel.local_bind_port,
        database='purplefrog$test',
        # connect_timeout=10
    )


    print ("connect successful!!")

    sql_select_Query = "select * from student"
    cursor = connection.cursor()
    cursor.execute(sql_select_Query)
    records = cursor.fetchall()
    print("Total number of rows in Student is: ", cursor.rowcount)


    connection.close()


