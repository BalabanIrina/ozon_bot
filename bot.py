# - *- coding: utf- 8 - *-

#-------------------------------
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


    sql_select_query = '''select id_student from student where s_status = 'student' '''
    cursor = connection.cursor()
    cursor.execute(sql_select_query)
    records = cursor.fetchall()
    ids = []
    for i in range(len(records)):
        ids.append(records[i][0])


    def name_to_id(text):
        sql_select_query = '''select id_student from student where s_name = (%s)'''
        cursor = connection.cursor()
        cursor.execute(sql_select_query, (text,))
        records = cursor.fetchall()
        print(records[0][0])
        return records[0][0]

    def test(c_id):
        sql_select_query = '''select c_name from student_course as sc join course as c on sc.id_course = c.id_course where id_student = (%s) and c_semester = 2'''
        cursor = connection.cursor()
        cursor.execute(sql_select_query, (c_id,))
        records = cursor.fetchall()
        if not records:
            return ['Ты пока не записан ни на один курс']
        for i in range(len(records)):
            records[i] = records[i][0]
            # if records[i] == 'Машинное обучение 2':
            #     records[i] = 'ML2'
            # records[i] = records[i].replace(' ', '_')
        return records


    def form(c_id):
        sql_select_query = '''select c_name, c_formula from course where c_semester=2'''
        cursor = connection.cursor()
        cursor.execute(sql_select_query)
        records = cursor.fetchall()
        return records


    def dl(c_id):
        sql_select_query = '''select c_name, w_name, w_deadline from work as w join course as c on w.id_course = c.id_course where c_semester=2'''
        cursor = connection.cursor()
        cursor.execute(sql_select_query)
        records = cursor.fetchall()
        cors = []
        for i in range(len(records)):
            cors.append(records[i][0])
            if not records[i][2]:
                records[i] = 'Пока заданий нет'
            else:
                records[i] = str(records[i][1]) + ' сделать к ' + records[i][2].strftime("%d/%m/%Y, %H:%M:%S")
        return cors, records

# connection.close()

#-------------------------------------------------------------

#-------------------------------------------------------------

#-------------------------------------------------------------
    # # подсасывает итоговые оценки

    # df = pd.read_csv('/home/purplefrog/bot/Grades.csv', sep=';', index_col='id_student')
    # df = df.fillna('нет данных')
    # # print(df)


    # # вообще не помню, что делает, но пока вроде ничего не ломает

    # idc_1 = []
    # for i in idc:
    #     if df_course['c_semestr'][i] == 1:
    #         idc_1.append(i)
    # print(idc_1)

    # title_1 = []
    # for i in idc_1:
    #     title_1.append(df_course['c_name'][i])
    # print(title_1)


    # формула к запросу итоговых оценок

    def check(cur_id, df_course, df_student_course):
        cur_courses = []
        name = []
        form = []
        for i in range(len(df_student_course)):
            if df_student_course['id_student'][i] == cur_id:
                cur_courses.append(df_student_course['id_course'][i])
        for i in cur_courses:
            for j in list(df_course.index):
                if i == j:
                    form.append(df_course['c_formula'][j])
        for i in cur_courses:
            for j in list(df_course.index):
                if i == j:
                    name.append(df_course['c_name'][j])
        strings = []
        for i in range(len(form)):
            strings.append('%s : %s' % (name[i], form[i]))
        print(strings)
        s = str()
        for i in range(len(form)):
            s += strings[i]
            s += '\n'
        res = 'Формулы курсов: \n%s' % s
        return res


    #-------------------------------------------------------------

    #-------------------------------------------------------------

    #-------------------------------------------------------------

    # работа с ботом

    import telebot
    import config
    # import telegram
    # from telegram import ReplyKeyboardMarkup
    # import os
    # import sys
    # from telebot import types



    bot = telebot.TeleBot(config.token)

    # начало работы

    # list_tg = {}

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
                    s2 = 'Можешь узнать на каких курсах ты учишься: /my_courses \n'
                    s3 = 'Mожешь посмотреть формулы оценивания курсов: /formulas \n'
                    # s5 = 'Можешь посмотреть свои оценки за прошлый семестр: /grades \n'
                    s4 = 'Можешь посмотреть текущие дедлайны: /deadlines\n'
                    s = s1 + s6 + s2 + s3 + s4
                    bot.send_message(message.from_user.id, s)
                    # print(list_tg)
                else:
                    bot.send_message(message.from_user.id, 'Либо ты пытаешь кого-то обмануть, либо ты очепятался. Попробуй заново: /start')
            except:
                bot.send_message(message.from_user.id, 'Либо ты пытаешь кого-то обмануть, либо ты очепятался. Попробуй заново: /start')
            finally:
                break



    #-------------------------------------------------------------

    #-------------------------------------------------------------

    #-------------------------------------------------------------

    # print(cur_id)

    @bot.message_handler(commands=["schedule"])
    def sh(message):
        string = 'ПН: Оптимизация в 30-08, \n        Дискретная оптимизация 55-26 (с 17.02)\n'
        string += 'ВТ: Машинное обучение в 30-08\n'
        string += 'СР: Бизнес аналитика в 30-08\n'
        string += 'ЧТ: Теория игр в 30.08 13.02, потом 55-26, \n       Проекты и продукты в 30-08 (с 20.02)\n'
        string += 'ПТ: Практикум по алгоритмам в 30-08'
        bot.send_message(message.from_user.id, string)

    # смотрим итоговые оценочки 1 семестра с подгруженного csv

    # @bot.message_handler(commands=["grades"])
    # def get_grade(message):
    #     # print(cur_id)
    #     grade_list = []
    #     for i in idc_1:
    #         grade_list.append(df[str(i)][cur_id])
    #     for i in range(len(grade_list)):
    #         if type(grade_list[i]) == str:
    #             pass
    #         if type(grade_list[i]) == int:
    #             grade_list[i] = str(grade_list[i])
    #         if type(grade_list[i]) == float:
    #             grade_list[i] = str(int(grade_list[i]))

    #     i = 0
    #     while i < len(title_1):

    #         print(title_1[i], grade_list[i])
    #         if grade_list[i] == 'нет данных':
    #             del grade_list[i]
    #             del title_1[i]
    #             i -= 1
    #         print(len(title_1))
    #         print(i)
    #         i += 1

    #     strings = []
    #     for i in range(len(title_1)):
    #         strings.append('%s : %s' % (title_1[i], grade_list[i]))
    #     print(strings)
    #     s = str()
    #     for i in range(len(title_1)):
    #         s += strings[i]
    #         s += '\n'
    #     res = 'Твои оценки: \n%s' % s
    #     bot.send_message(message.from_user.id, res)


    #-------------------------------------------------------------

    #-------------------------------------------------------------

    #-------------------------------------------------------------



    @bot.message_handler(commands=["my_courses"])
    def get_course(message):
        if cur_id == -1:
            bot.send_message(message.from_user.id, 'Начни со /start')
        else:
            res = test(cur_id)
            string = str()
            for i in range(len(res)):
                # string += '/'
                string += str(res[i])
                string += '\n'
            bot.send_message(message.from_user.id, string)

    # @bot.message_handler(commands=["ML2"])
    # def ml2(message):
    #     string = 'Занятия по вторникам в 30-08, дз пока нет'
    #     bot.send_message(message.from_user.id, string)


    # пока всех

    @bot.message_handler(commands=["formulas"])
    def get_formulas(message):
        if cur_id == -1:
            bot.send_message(message.from_user.id, 'Начни со /start')
        else:
            res = form(cur_id)
            string = str()
            for i in range(len(res)):
                string += str(res[i][0])
                string += ' : '
                string += str(res[i][1])
                string += '\n\n'
            bot.send_message(message.from_user.id, string)


    # тестим на пустых?

    @bot.message_handler(commands=["deadlines"])
    def get_deadline(message):
        if cur_id == -1:
            bot.send_message(message.from_user.id, 'Начни со /start')
        else:
            cor, res = dl(cur_id)
            string = str()
            for i in range(len(cor)):
                string += str(cor[i])
                string += ' : '
                string += str(res[i])
                string += '\n\n'
            bot.send_message(message.from_user.id, string)


    # @bot.message_handler(commands=["cur_grades"])
    # def get_cur_grade(message):

    #     res = 0
    #     bot.send_message(message.from_user.id, res)


    if __name__ == '__main__':
         bot.polling(none_stop=True)

connection.close()