import mysql.connector
# Connection with database
def connect_data():
   x = mysql.connector.connect(
       host = "localhost",
       user = '1122',
       password ='1122',
       database = "hospital",
       auth_plugin = 'mysql_native_password'
   )
   return x
  
# this function prints and save data in database
def print_and_save_data(db_pointer  ,table_name):
   sql = "DESCRIBE {}".format(table_name)
   db_pointer.execute(sql)
   my = db_pointer.fetchall()
   columns =  []  
   # GET all columns name in data
   for c in my:
       columns.append(c[0])
   sql = "SELECT * FROM {}".format(table_name)
   db_pointer.execute(sql)
   res = db_pointer.fetchall()
   data = []
   for s in res:
       data.append(s)
   print(columns)
   print(data)
# open and create new file save data in file with columns name   
file = open("{}.txt".formate(table), "w")
   file.write(columns + "\n")
   file.write(data + "\n")
   file.close()


if __name__=='__main__':
   print('MAIN PROGRAM')
   db_pointer = connect_data()
   Db_pointer = db_pointer.cursor()

   Db_pointer.execute("SHOW TABLES")
   myresult = Db_pointer.fetchall()
   for table in myresult:
       print_and_save_data(Db_pointer , table)
