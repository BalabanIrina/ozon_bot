# - *- coding: utf- 8 - *-

#-------------------------------------------------------------

#-------------------------------------------------------------

#-------------------------------------------------------------

# bot info


token = '958568938:AAHk8zopgtL9hImpTDq-cJY12lRHHcvM_Qo'
bot_info = {'id': 1058884761, 'is_bot': True, 'first_name': 'test_bot', 'username': 'test_ozonmasters_bot'}

#-------------------------------------------------------------

#-------------------------------------------------------------

#-------------------------------------------------------------


# подключение к базе данных

import mysql.connector
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
    )


    print ("connect successful!!")

#-------------------------------------------------------------

#-------------------------------------------------------------

#-------------------------------------------------------------


# выгружаем айдишники живых

    sql_select_query = '''select id_student from student where s_status = 'student' '''
    cursor = connection.cursor()
    cursor.execute(sql_select_query)
    records = cursor.fetchall()
    ids = []
    for i in range(len(records)):
        ids.append(records[i][0])

# переводим фамилию в айди студента

    def name_to_id(text):
        sql_select_query = '''select id_student from student where s_name = (%s)'''
        cursor = connection.cursor()
        cursor.execute(sql_select_query, (text,))
        records = cursor.fetchall()
        print(records[0][0])
        return records[0][0]

# достаем курсы и комманды для курсов студента

    def courses(c_id):
        sql_select_query = '''select c_name, c_abbreviation from student_course
            as sc join course as c on sc.id_course = c.id_course
            where id_student = (%s) and c_semester = 2'''
        cursor = connection.cursor()
        cursor.execute(sql_select_query, (c_id,))
        records = cursor.fetchall()
        names = []
        abbs = []
        print(records)
        if not records:
            return ['Ты пока не записан ни на один курс']
        for i in range(len(records)):
            names.append(records[i][0])
            abbs.append(records[i][1])
        return names, abbs

# просто формулы?

    def form(c_id):
        sql_select_query = '''select c_name, c_formula from course where c_semester=2'''
        cursor = connection.cursor()
        cursor.execute(sql_select_query)
        records = cursor.fetchall()
        return records

    def ml(c_id):
        sql_select_query = '''select w_name, w_deadline, grade from work as w
            join student_work as sw on w.id_work = sw.id_work where id_student = (%s) and id_course = 9518'''
        cursor = connection.cursor()
        cursor.execute(sql_select_query, (c_id,))
        records = cursor.fetchall()
        if not records:
            return 'Пока нет актуальной информации'
            # break
        print(records)
        return records

    def bi(c_id):
        sql_select_query = '''select w_name, w_deadline, grade from work as w
            join student_work as sw on w.id_work = sw.id_work where id_student = (%s) and id_course = 1974'''
        cursor = connection.cursor()
        cursor.execute(sql_select_query, (c_id,))
        records = cursor.fetchall()
        if not records:
            return 'Пока нет актуальной информации'
            # break
        print(records)
        return records

    # def dl(c_id):
    #     sql_select_query = '''select c_name, w_name, w_deadline from work as w join course as c on w.id_course = c.id_course where c_semester=2'''
    #     cursor = connection.cursor()
    #     cursor.execute(sql_select_query)
    #     records = cursor.fetchall()
    #     cors = []
    #     for i in range(len(records)):
    #         cors.append(records[i][0])
    #         if not records[i][2]:
    #             records[i] = 'Пока заданий нет'
    #         else:
    #             records[i] = str(records[i][1]) + ' сделать к ' + records[i][2].strftime("%d/%m/%Y, %H:%M:%S")
    #     return cors, records


#-------------------------------------------------------------

#-------------------------------------------------------------

#-------------------------------------------------------------


# работа с ботом

    import telebot
    # import config
    # import telegram
    # from telegram import ReplyKeyboardMarkup
    # import os
    # import sys
    # from telebot import types



    bot = telebot.TeleBot(token)

    #-------------------------------------------------------------

    #-------------------------------------------------------------

    #-------------------------------------------------------------

    @bot.message_handler(commands=["start"])
    def keyboard(message):
        send = bot.send_message(message.from_user.id, 'Напиши свою фамилию, и мы посмотрим, что с этим можно сделать')
        bot.register_next_step_handler(send, check_id)


    def check_id(message):

        global cur_id
        cur_id = -1
        while True:
            try:
                cur_id = name_to_id(message.text)
                if cur_id in ids:
                    # list_tg[message.from_user.id] = message.text
                    s1 = 'Ты учишься в OzonMasters, мои поздравления.\n'
                    s6 = 'Расписание: /schedule \n'
                    s3 = 'Формулы оценивания курсов: /formulas \n'
                    s2 = 'Можешь узнать на каких курсах ты учишься: /my_courses \n'
                    s = s1 + s3 + s6 + s2
                    bot.send_message(message.from_user.id, s)
                else:
                    bot.send_message(message.from_user.id, 'Либо ты пытаешь кого-то обмануть, либо ты очепятался. Попробуй заново: /start')
            except:
                bot.send_message(message.from_user.id, 'Либо ты пытаешь кого-то обмануть, либо ты очепятался. Попробуй заново: /start')
            finally:
                break



    #-------------------------------------------------------------

    #-------------------------------------------------------------

    #-------------------------------------------------------------

# запрос расписания

    @bot.message_handler(commands=["schedule"])
    def sh(message):
        string = 'ПН: Оптимизация в 30-08, \n        Дискретная оптимизация 55-26 (с 17.02)\n'
        string += 'ВТ: Машинное обучение в 30-08\n'
        string += 'СР: Бизнес аналитика в 30-08\n'
        string += 'ЧТ: Теория игр в 55-26, \n       Проекты и продукты в 30-08 (с 20.02)\n'
        string += 'ПТ: Практикум по алгоритмам в 30-08'
        print('Запрос расписания')
        bot.send_message(message.from_user.id, string)

# запрос формул

    @bot.message_handler(commands=["formulas"])
    def get_formulas(message):
        res = form(cur_id)
        string = str()
        for i in range(len(res)):
            string += str(res[i][0])
            string += ' : '
            string += str(res[i][1])
            string += '\n\n'
        print('Запрос формул')
        bot.send_message(message.from_user.id, string)

# запрос курсов

    @bot.message_handler(commands=["my_courses"])
    def get_course(message):
        names, abbs = courses(cur_id)
        string = 'Информация по твоим курсам:\n'
        for i in range(len(names)):
            # string += '/'
            string += str(names[i])
            string += ' : /'
            string += str(abbs[i])
            string += '\n'
        bot.send_message(message.from_user.id, string)


# для каждого курса вытаскиваем по нему инфу для конкретного студента (дедлайн, task, оценки?)


    @bot.message_handler(commands=["ML2"])
    def ml2(message):
        res = ml(cur_id)
        # string = str()
        bot.send_message(message.from_user.id, res)

    @bot.message_handler(commands=["Opt1"])
    def opt(message):
        # dl, hw, grades = ml(cur_id)
        string = str()
        bot.send_message(message.from_user.id, string)

    @bot.message_handler(commands=["PAlgo"])
    def algo(message):
        # dl, hw, grades = ml(cur_id)
        string = str()
        bot.send_message(message.from_user.id, string)

    @bot.message_handler(commands=["GT"])
    def gt(message):
        # dl, hw, grades = ml(cur_id)
        string = str()
        bot.send_message(message.from_user.id, string)

    @bot.message_handler(commands=["DOpt"])
    def dopt(message):
        # dl, hw, grades = ml(cur_id)
        string = str()
        bot.send_message(message.from_user.id, string)

    @bot.message_handler(commands=["PandP"])
    def pp(message):
        # dl, hw, grades = ml(cur_id)
        string = str()
        bot.send_message(message.from_user.id, string)

    @bot.message_handler(commands=["PBI"])
    def pbi(message):
        res = bi(cur_id)
        # string = str()
        bot.send_message(message.from_user.id, res)



    # тестим на пустых?

    # @bot.message_handler(commands=["deadlines"])
    # def get_deadline(message):
    #     cor, res = dl(cur_id)
    #     string = str()
    #     for i in range(len(cor)):
    #         string += str(cor[i])
    #         string += ' : '
    #         string += str(res[i])
    #         string += '\n\n'
    #     bot.send_message(message.from_user.id, string)


    # @bot.message_handler(commands=["cur_grades"])
    # def get_cur_grade(message):

    #     res = 0
    #     bot.send_message(message.from_user.id, res)


    if __name__ == '__main__':
         bot.polling(none_stop=True)

connection.close()