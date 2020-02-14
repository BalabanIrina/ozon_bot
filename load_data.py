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

    import csv
    from pandas import DataFrame

    ids = []
    name = []
    year = []
    status = []
    group = []
    all_data = []

    with open('Students2.csv', newline='', encoding='ascii') as csvfile:
        spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')
        for row in spamreader:
            all_data.append((row[0]).split(';'))
            ids.append(int((row[0]).split(';')[0]))
            name.append((row[0]).split(';')[1])
            year.append(int((row[0]).split(';')[2]))
            status.append((row[0]).split(';')[3])
            group.append((row[0]).split(';')[4])


    student = {'id_student': ids,
        's_name': name,
        's_yaer': year,
        's_status': status,
        's_group': group
        }

    df = DataFrame(student, columns= ['id_student', 's_name', 's_yaer', 's_status', 's_group'])

    print (df)


    # sql_select_Query = "LOAD DATA INFILE 'Students2.csv' INTO TABLE student FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY ''"
    cursor = connection.cursor()
    # insert_stmt = (
    # "INSERT INTO student (id, name, year, status, group)"
    # "VALUES (%s, %s, %s, %s, %s)"
    # )
    # for i in range(len(ids)):
    #     data = (ids[i], name[i], year[i], status[i], group[i])
    #     cursor.execute(insert_stmt, data)
    #     conn.commit()

    # cursor.execute('''
    # CREATE TABLE student (
    # id_student INTEGER NOT NULL UNIQUE,
    # s_name VARCHAR(50) NOT NULL,
    # s_year INTEGER NOT NULL,
    # s_status VARCHAR(10) NOT NULL,
    # s_group VARCHAR(10) NOT NULL,
    # PRIMARY KEY (id_student))
    #     ''')

    # print(1)
    # df.to_sql('student', connection, if_exists='replace', index = False)

    #------падает тут---------

    # cursor.execute('''INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (ids[0], name[0], year[0], status[0], group[0]);''')
    # cursor.execute('''
    # INSERT INTO student (id_student, s_name, s_year, s_status, s_group) VALUES (57790, 'antonov', 2019, 'student', 'BI')
    #     ''')

    # records = cursor.fetchall()

    cursor.execute('''
    SELECT * FROM student
        ''')

    # cursor.execute(sql_select_Query)
    records = cursor.fetchall()
    print("Total number of rows in Student is: ", cursor.rowcount)


    connection.close()


