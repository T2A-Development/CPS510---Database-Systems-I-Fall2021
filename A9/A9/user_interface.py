#!/usr/bin/env python
import tkinter as tk
import cx_Oracle
import connect_info
from tkinter import N, S, W, E, simpledialog


def find_query_name(query):
    """
    Used to find a query name
    """
    return query[:query.find('(')]


class main_window:
    """
    The main application window containing up to 4 buttons:
    CREATE,POPULATE,DROP Tables, and Run a custom query
    """

    def __init__(self):
        self.root = tk.Tk()
        self.root.title('Job Bank App')
        self.root.geometry("600x400")
        self.label = tk.Label(self.root)

        self.buttonTopLeft = tk.Button(self.root,
                                       text='Please Connect to DataBase',
                                       command=self.connect_to_db)
        self.buttonTopRight = tk.Button(self.root,
                                        text='DROP TABLES',
                                        command=self.dropTables)
        self.buttonBottomLeft = tk.Button(self.root,
                                          text='POPULATE TABLES',
                                          command=self.populateTables)
        self.buttonBottomRight = tk.Button(self.root,
                                           text='RUN A CUSTOM QUERY',
                                           command=self.runCustomQuery)

        self.buttonTopLeft.grid(column=0, row=0, sticky=N + S + E + W)
        self.buttonTopRight.grid(column=1, row=0, sticky=N + S + E + W)
        self.buttonBottomLeft.grid(column=0, row=1, sticky=N + S + E + W)
        self.buttonBottomRight.grid(column=1, row=1, sticky=N + S + E + W)
        self.label.grid(column=2, row=2, sticky=N + S + E + W)

        # set weight to make the window responsive
        for i in range(2):
            self.root.grid_rowconfigure(i, weight=1)
        for i in range(2):
            self.root.grid_columnconfigure(i, weight=1)

        # temporary hide the 3 other buttons
        self.buttonTopRight.grid_remove()
        self.buttonBottomLeft.grid_remove()
        self.buttonBottomRight.grid_remove()
        # run the mainloop
        self.root.mainloop()

    def quit(self):
        self.root.destroy()
        self.cursor.close()
        self.connection.close()

    def createTables(self):
        create_file = open('createTables.txt', 'r')
        create_tables_list = create_file.read().split(';')
        try:
            for table in create_tables_list:
                print(f"Executing {find_query_name(table)}")
                self.connection.cursor().execute(table)
            string = "Successfully created tables"
            self.connection.cursor().execute('CREATE TABLE Qualifications (qualification_id VARCHAR2(10 CHAR),edu_level VARCHAR2(50 CHAR),JB_User_id VARCHAR2(25 CHAR),experience NUMBER,coverLetter VARCHAR2(1000 CHAR),certi_license VARCHAR2(25 CHAR),PRIMARY KEY(qualification_id),FOREIGN KEY(JB_User_id) REFERENCES JB_Users(login_id));')
        except:
            string = 'Some Tables may not be created...'
        string = "Successfully created tables"
        newWin = tk.Tk()
        textBox = tk.Text(newWin)
        textBox.insert(tk.INSERT, string)
        textBox.config(state=tk.DISABLED)
        textBox.pack()
        newButton = tk.Button(newWin, text='close', command=newWin.destroy)
        newButton.pack()
        newWin.mainloop()

    def populateTables(self):
        populate_file = open("populateTables.txt", "r")
        populate_tables_string = populate_file.read().split(';')
        try:
            for table in populate_tables_string:
                print(f"Executing {find_query_name(table)}")
                self.connection.cursor().execute(table)
            string = "Successfully populated tables"
        except:
            string = 'some table might not got populated...'
        string = "Successfully populated tables"
        newWin = tk.Tk()
        textBox = tk.Text(newWin)
        textBox.insert(tk.INSERT, string)
        textBox.config(state=tk.DISABLED)
        textBox.pack()
        newButton = tk.Button(newWin, text='close', command=newWin.destroy)
        newButton.pack()

        newWin.mainloop()

    def dropTables(self):
        drop_file = open('dropTables.txt', 'r')
        drop_tables_list = drop_file.read().split(";")
        try:
            for drop_table in drop_tables_list:
                self.connection.cursor().execute(drop_table)
            string = "Successfully dropped tables"
        except:
            string = 'Some tables might not got dropped.'
        string = "Successfully dropped tables"
        newWin = tk.Tk()
        textBox = tk.Text(newWin)
        textBox.insert(tk.INSERT, string)
        textBox.config(state=tk.DISABLED)
        textBox.pack()
        newButton = tk.Button(newWin, text='close', command=newWin.destroy)
        newButton.pack()
        newWin.mainloop()

    def runCustomQuery(self):
        try:
            query = simpledialog.askstring(title="Query Results", prompt=("Input Custom Query Here: " + " " * 100))
            self.cursor.execute(query)

            result = self.cursor.fetchall()
            print(result)
            string = ''

            for res in result:
                for x in res:
                    string = string + str(x) + ', \n'
                string = string + '\n'
        except cx_Oracle.Error as error:
            string = error

        newWin = tk.Tk()
        textBox = tk.Text(newWin)
        textBox.insert(tk.INSERT, string)
        textBox.config(state=tk.DISABLED)
        textBox.pack()
        newButton = tk.Button(newWin, text='close', command=newWin.destroy)
        newButton.pack()

        newWin.mainloop()

    def connect_to_db(self):
        """
        Connect to the Oracle DMBS and restore the right layout through
        self.restore_layout()
        """
        self.connection = None
        try:
            self.connection = cx_Oracle.connect(
                connect_info.username,
                connect_info.password,
                connect_info.dsn,
                encoding=connect_info.encoding)
            self.cursor = self.connection.cursor()

            # show the version of the Oracle Database
            string = 'Connected successfully to: ' + self.connection.version
            print(self.connection.version)
        except cx_Oracle.Error as error:
            string = error
            print(error)

        # restore the layout to the correct one
        self.restore_layout()

        newWin = tk.Tk()
        textBox = tk.Text(newWin)
        textBox.insert(tk.INSERT, string)
        textBox.config(state=tk.DISABLED)
        textBox.pack()
        newButton = tk.Button(newWin, text='close', command=newWin.destroy)
        newButton.pack()

        newWin.mainloop()

    def restore_layout(self):
        """
        Change the text on the right button and restore the other 3 buttons in the grid
        """
        # change the text on the top left button
        self.buttonTopLeft.configure(text="CREATE TABLES", command=self.createTables)

        # return buttons to the window
        self.buttonTopRight.grid()
        self.buttonBottomLeft.grid()
        self.buttonBottomRight.grid()
        self.root.geometry("800x600")


if __name__ == "__main__":
    main_window()
