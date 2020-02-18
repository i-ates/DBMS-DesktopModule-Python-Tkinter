import GiveOrderScreen
import ShowTable
import ShowInsertUpdateDeleteTables

import tkinter as tk
import RestaurantManagement_support
import mysql.connector
import tkinter.messagebox

def vp_start_gui():
    '''Starting point when module is the main routine.'''
    global val, w, root
    root = tk.Tk()
    top = Toplevel(root)
    RestaurantManagement_support.init(root, top)
    root.mainloop()


w = None

with open('database.config', 'r+') as reader:
    line = reader.readline()
    databasename = line.split("\n")[0]
    line = reader.readline()
    username = line.split("\n")[0]
    line = reader.readline()
    password = line.split("\n")[0]


def create_Toplevel(root, *args, **kwargs):
    '''Starting point when module is imported by another program.'''
    global w, w_win, rt
    rt = root
    w = tk.Toplevel(root)
    top = Toplevel(w)
    RestaurantManagement_support.init(w, top, *args, **kwargs)
    return (w, top)


def destroy_Toplevel():
    global w
    w.destroy()
    w = None


def callback(self):
    with open('database.config', 'w+') as writer:
        writer.writelines(self.Text2.get() + "\n")
        writer.writelines(self.Text3.get() + "\n")
        writer.writelines(self.Text4.get() + "\n")
        writer.close()
    try:
        self.cnx = mysql.connector.connect(user=self.Text3.get(), password=self.Text4.get(),
                                           host="localhost", database=self.Text2.get())
        self.mycursor = self.cnx.cursor()
        tkinter.messagebox.showinfo("Connection","Connection Successful!")

    except Exception:
        tkinter.messagebox.showinfo("Connection","Connection Failed.Please try again!")


class Toplevel:
    def __init__(self, top=None):
        '''This class configures and populates the toplevel window.
           top is the toplevel containing window.'''
        _bgcolor = '#d9d9d9'  # X11 color: 'gray85'
        _fgcolor = '#000000'  # X11 color: 'black'
        _compcolor = '#d9d9d9'  # X11 color: 'gray85'
        _ana1color = '#d9d9d9'  # X11 color: 'gray85'
        _ana2color = '#ececec'  # Closest X11 color: 'gray92'

        top.geometry("900x500")
        top.minsize(120, 1)
        top.maxsize(1370, 749)
        top.resizable(1, 1)
        top.title("Restaurant Management Application")
        top.configure(background="#d9d9d9")
        top.configure(highlightbackground="#d9d9d9")
        top.configure(highlightcolor="black")

        self.Label = tk.Label(top)
        self.Label.place(relx=0.16, rely=0.1, height=50, width=250)
        self.Label.configure(background="#d9d9d9")
        self.Label.config(font=("Courier", 24))
        self.Label.configure(disabledforeground="#a3a3a3")
        self.Label.configure(foreground="#000000")
        self.Label.configure(text='''Menu''')

        self.InsertDataButton = tk.Button(top)
        self.InsertDataButton.place(relx=0.15, rely=0.2, height=50, width=250)
        self.InsertDataButton.configure(activebackground="#ececec")
        self.InsertDataButton.configure(activeforeground="#000000")
        self.InsertDataButton.configure(background="#d9d9d9")
        self.InsertDataButton.configure(disabledforeground="#a3a3a3")
        self.InsertDataButton.configure(foreground="#000000")
        self.InsertDataButton.configure(highlightbackground="#d9d9d9")
        self.InsertDataButton.configure(highlightcolor="black")
        self.InsertDataButton.configure(pady="0")
        self.InsertDataButton.configure(text='''Show Statistics''')
        self.InsertDataButton.configure(command=ShowTable.vp_start_gui)

        self.GiveOrderButton = tk.Button(top)
        self.GiveOrderButton.place(relx=0.15, rely=0.35, height=50, width=250)
        self.GiveOrderButton.configure(activebackground="#ececec")
        self.GiveOrderButton.configure(activeforeground="#000000")
        self.GiveOrderButton.configure(background="#d9d9d9")
        self.GiveOrderButton.configure(disabledforeground="#a3a3a3")
        self.GiveOrderButton.configure(foreground="#000000")
        self.GiveOrderButton.configure(highlightbackground="#d9d9d9")
        self.GiveOrderButton.configure(highlightcolor="black")
        self.GiveOrderButton.configure(pady="0")
        self.GiveOrderButton.configure(text='''Give Order''')
        self.GiveOrderButton.configure(command=GiveOrderScreen.vp_start_gui)

        self.ShowDataButton = tk.Button(top)
        self.ShowDataButton.place(relx=0.15, rely=0.50, height=50, width=250)
        self.ShowDataButton.configure(activebackground="#ececec")
        self.ShowDataButton.configure(activeforeground="#000000")
        self.ShowDataButton.configure(background="#d9d9d9")
        self.ShowDataButton.configure(disabledforeground="#a3a3a3")
        self.ShowDataButton.configure(foreground="#000000")
        self.ShowDataButton.configure(highlightbackground="#d9d9d9")
        self.ShowDataButton.configure(highlightcolor="black")
        self.ShowDataButton.configure(pady="0")
        self.ShowDataButton.configure(text='''Show & Insert & Update & Delete Tables''')
        self.ShowDataButton.configure(command=ShowInsertUpdateDeleteTables.vp_start_gui)

        self.Label1 = tk.Label(top)
        self.Label1.place(relx=0.530, rely=0.2, height=50, width=300)
        self.Label1.configure(background="#d9d9d9")
        self.Label1.config(font=("Courier", 24))
        self.Label1.configure(disabledforeground="#a3a3a3")
        self.Label1.configure(foreground="#000000")
        self.Label1.configure(text='''Connect Database''')

        self.Label2 = tk.Label(top)
        self.Label2.place(relx=0.500, rely=0.3, height=20, width=150)
        self.Label2.configure(background="#d9d9d9")
        self.Label2.configure(disabledforeground="#a3a3a3")
        self.Label2.configure(foreground="#000000")
        self.Label2.configure(text='''Database Name''')

        self.Text2 = tk.Entry(top)
        self.Text2.place(relx=0.650, rely=0.3, relheight=0.05, relwidth=0.2)
        self.Text2.configure(background="white")
        self.Text2.configure(font="-family {Segoe UI} -size 9")
        self.Text2.configure(foreground="black")
        self.Text2.configure(highlightbackground="#d9d9d9")
        self.Text2.configure(highlightcolor="black")
        self.Text2.configure(insertbackground="black")
        self.Text2.configure(selectbackground="#c4c4c4")
        self.Text2.configure(selectforeground="black")
        self.Text2.insert(tk.END, databasename)

        self.Label3 = tk.Label(top)
        self.Label3.place(relx=0.500, rely=0.35, height=20, width=150)
        self.Label3.configure(background="#d9d9d9")
        self.Label3.configure(disabledforeground="#a3a3a3")
        self.Label3.configure(foreground="#000000")
        self.Label3.configure(text='''Database User Name''')

        self.Text3 = tk.Entry(top)
        self.Text3.place(relx=0.650, rely=0.35, relheight=0.05, relwidth=0.2)
        self.Text3.configure(background="white")
        self.Text3.configure(font="-family {Segoe UI} -size 9")
        self.Text3.configure(foreground="black")
        self.Text3.configure(highlightbackground="#d9d9d9")
        self.Text3.configure(highlightcolor="black")
        self.Text3.configure(insertbackground="black")
        self.Text3.configure(selectbackground="#c4c4c4")
        self.Text3.configure(selectforeground="black")
        self.Text3.insert(tk.END, username)

        self.Label4 = tk.Label(top)
        self.Label4.place(relx=0.500, rely=0.40, height=20, width=150)
        self.Label4.configure(background="#d9d9d9")
        self.Label4.configure(disabledforeground="#a3a3a3")
        self.Label4.configure(foreground="#000000")
        self.Label4.configure(text='''Database Password''')

        self.Text4 = tk.Entry(top)
        self.Text4.place(relx=0.650, rely=0.40, relheight=0.05, relwidth=0.2)
        self.Text4.configure(background="white")
        self.Text4.configure(font="-family {Segoe UI} -size 9")
        self.Text4.configure(foreground="black")
        self.Text4.configure(highlightbackground="#d9d9d9")
        self.Text4.configure(highlightcolor="black")
        self.Text4.configure(insertbackground="black")
        self.Text4.configure(selectbackground="#c4c4c4")
        self.Text4.configure(selectforeground="black")
        self.Text4.insert(tk.END, password)

        self.SaveButton = tk.Button(top)
        self.SaveButton.place(relx=0.550, rely=0.50, height=40, width=200)
        self.SaveButton.configure(activebackground="#ececec")
        self.SaveButton.configure(activeforeground="#000000")
        self.SaveButton.configure(background="#d9d9d9")
        self.SaveButton.configure(disabledforeground="#a3a3a3")
        self.SaveButton.configure(foreground="#000000")
        self.SaveButton.configure(highlightbackground="#d9d9d9")
        self.SaveButton.configure(highlightcolor="black")
        self.SaveButton.configure(pady="0")
        self.SaveButton.configure(text='''Connect''')
        self.SaveButton.configure(command=(lambda: callback(self)))


if __name__ == '__main__':
    vp_start_gui()
