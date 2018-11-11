import psycopg2 as pg2

# resource: https://linuxhint.com/postgresql_python/
# resource: https://dba.stackexchange.com/questions/1285/how-do-i-list-all-databases-and-tables-using-psql/34419
# resource: The Complete SQL Bootcamp - Udemy

# secret = 'REDACTED' #notice that password and username have been redacted

if __name__ == "__main__":
    try:
        conn = pg2.connect(database='newdvddatabase', user='REDACTED', password=secret)
        print("connected to the database")

    except:
        print("Unable to connect to the database")


    cur = conn.cursor()
    query = "SELECT * FROM public.customer;"

    try:
        cur.execute(query)
        conn.commit();
        result_list = cur.fetchmany(12)
        for item in result_list:
            print(item, '\n')
        print("Query executed")
        print("first result, first name: ", result_list[0][2])
        print("first result, amount: ", result_list[0][4])
    except:
        print("Query FAILED to execute")

  cur.close() # optional, closing connection always closes any associated cursors
  conn.close()
  
