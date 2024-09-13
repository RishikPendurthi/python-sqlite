import sqlite3 
# Connect to a database 
connection = sqlite3.connect('task3.db')
cursor = connection.cursor()
cursor.execute('''CREATE TABLE player (id INTEGER PRIMARY KEY, name TEXT, highestscore INTEGER)''')
cursor.execute("INSERT INTO player (ID, name, highestscore) VALUES (10, 'Sachin', 200),(18, 'Kohli', 183)") 
cursor.execute("INSERT INTO player (ID, name, highestscore) VALUES (?,?,?)", (45, 'rohit', 264)) 
cursor.execute("SELECT * FROM player") 
rows = cursor.fetchall() 
for row in rows: 
    print(row)
try: 
    cursor.execute("SELECT * FROM non_existing_table") 
except sqlite3.OperationalError as e: 
    print(f"An error occurred: {e}")
connection.commit() 

connection.close() 
