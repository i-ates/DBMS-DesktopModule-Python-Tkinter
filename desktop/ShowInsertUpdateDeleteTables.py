import sys
import mysql.connector

try:
    import Tkinter as tk
except ImportError:
    import tkinter as tk

try:
    import ttk

    py3 = False
except ImportError:
    import tkinter.ttk as ttk

    py3 = True

import ShowInsertUpdateDeleteTables_support




def vp_start_gui():
    '''Starting point when module is the main routine.'''
    global val, w, root
    root = tk.Tk()
    ShowInsertUpdateDeleteTables_support.set_Tk_var()
    top = Toplevel1(root)
    ShowInsertUpdateDeleteTables_support.init(root, top)
    root.mainloop()



w = None

def create_Toplevel1(root, *args, **kwargs):
    '''Starting point when module is imported by another program.'''
    global w, w_win, rt
    rt = root
    w = tk.Toplevel(root)
    ShowInsertUpdateDeleteTables_support.set_Tk_var()
    top = Toplevel1(w)
    ShowInsertUpdateDeleteTables_support.init(w, top, *args, **kwargs)
    return (w, top)


with open('database.config', 'r+') as reader:
    line = reader.readline()
    databasename = line.split("\n")[0]
    line = reader.readline()
    username = line.split("\n")[0]
    line = reader.readline()
    password = line.split("\n")[0]
    reader.close()


def destroy_Toplevel1():
    global w
    w.destroy()
    w = None

newnum = 0

class Toplevel1:
    def __init__(self, top=None):
        try:
            self.cnx = mysql.connector.connect(user=username,
                                               password=password,
                                               host="localhost", database=databasename)
            self.mycursor = self.cnx.cursor()
        except Exception:
            print(Exception)

        '''This class configures and populates the toplevel window.
           top is the toplevel containing window.'''
        _bgcolor = '#d9d9d9'  # X11 color: 'gray85'
        _fgcolor = '#000000'  # X11 color: 'black'
        _compcolor = '#d9d9d9'  # X11 color: 'gray85'
        _ana1color = '#d9d9d9'  # X11 color: 'gray85'
        _ana2color = '#ececec'  # Closest X11 color: 'gray92'
        self.style = ttk.Style()
        if sys.platform == "win32":
            self.style.theme_use('winnative')
        self.style.configure('.', background=_bgcolor)
        self.style.configure('.', foreground=_fgcolor)
        self.style.configure('.', font="TkDefaultFont")
        self.style.map('.', background=
        [('selected', _compcolor), ('active', _ana2color)])

        top.geometry("1290x795+337+118")
        top.minsize(120, 1)
        top.maxsize(1924, 1061)
        top.resizable(1, 1)
        top.title("Show Insert Update Delete Tables")
        top.configure(background="#d9d9d9")

        self.Label1 = tk.Label(top)
        self.Label1.place(relx=0.07, rely=0.038, height=21, width=68)
        self.Label1.configure(background="#d9d9d9")
        self.Label1.configure(disabledforeground="#a3a3a3")
        self.Label1.configure(foreground="#000000")
        self.Label1.configure(text='''Select Table''')

        entries = []

        def dolist(event):
            global newnum
            try:
                for entry in entries:
                    label = entry[0]
                    en = entry[1]
                    en.destroy()
                    label.destroy()
            except:
                print("Destroy error")

            mynum = 0
            self.Scrolledtreeview1 = ScrolledTreeView(top)
            self.Scrolledtreeview1.place(relx=0.07, rely=0.088, relheight=0.286, relwidth=0.837)

            cursorstr3 = ("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = '" +
                          databasename + "' AND TABLE_NAME = '" + self.TCombobox1.get() +
                          "' ORDER BY ORDINAL_POSITION;")

            self.mycursor.execute(cursorstr3)
            result2 = self.mycursor.fetchall()
            self.Scrolledtreeview1.configure(columns=result2)
            self.Scrolledtreeview1.column("#0", stretch="NO", minwidth=0, width=0)

            i = 0.478
            for item in result2:
                self.Scrolledtreeview1.heading(item, text=item)
                self.Label2 = tk.Label(top)
                self.Label2.place(relx=0.15, rely=i, height=20, width=150)
                self.Label2.configure(background="#d9d9d9")
                self.Label2.configure(disabledforeground="#a3a3a3")
                self.Label2.configure(foreground="#000000")
                self.Label2.configure(text=item)
                self.Text = tk.Entry(top)
                self.Text.place(relx=0.30, rely=i, relheight=0.03, relwidth=0.20)
                self.Text.configure(background="white")
                self.Text.configure(font="-family {Segoe UI} -size 9")
                self.Text.configure(foreground="black")
                self.Text.configure(insertbackground="black")
                entries.append((self.Label2, self.Text))
                i += 0.05
                mynum = mynum + 1

            f_str = self.TCombobox1.get()
            query = "SELECT * FROM " + f_str
            self.mycursor.execute(query)
            result = self.mycursor.fetchall()

            def on_click(event):
                item_id = event.widget.focus()
                item2 = event.widget.item(item_id)
                values = item2['values']
                i22 = 0
                for entry in entries[-mynum:]:
                    en = entry[1]
                    en.delete(0, 'end')
                    en.insert(0, values[i22])
                    i22 += 1

            self.Scrolledtreeview1.bind("<Double-Button-1>", on_click)

            for item in result:
                self.Scrolledtreeview1.insert('', 'end', values=item)

            self.Label3 = tk.Label(top)
            self.Label3.place(relx=0.600, rely=0.500, height=20, width=150)
            self.Label3.configure(background="#d9d9d9")
            self.Label3.configure(disabledforeground="#a3a3a3")
            self.Label3.configure(foreground="#000000")
            self.Label3.configure(text='''Count of columns''')

            self.Text3 = tk.Text(top)
            self.Text3.place(relx=0.750, rely=0.500, relheight=0.03, relwidth=0.03)
            self.Text3.configure(background="white")
            self.Text3.configure(font="-family {Segoe UI} -size 9")
            self.Text3.configure(foreground="black")
            self.Text3.configure(highlightbackground="#d9d9d9")
            self.Text3.configure(highlightcolor="black")
            self.Text3.configure(insertbackground="black")
            self.Text3.configure(selectbackground="#c4c4c4")
            self.Text3.configure(selectforeground="black")
            self.Text3.configure(wrap="word")
            self.Text3.insert(tk.END, mynum)
            self.Text3.tag_configure("center", justify='center')
            self.Text3.tag_add("center", 1.0, "end")
            self.Text3.config(state="disabled")

            self.Label4 = tk.Label(top)
            self.Label4.place(relx=0.600, rely=0.550, height=20, width=150)
            self.Label4.configure(background="#d9d9d9")
            self.Label4.configure(disabledforeground="#a3a3a3")
            self.Label4.configure(foreground="#000000")
            self.Label4.configure(text='''Count of records''')

            self.mycursor.execute("SELECT COUNT(*) FROM " + self.TCombobox1.get())
            result = self.mycursor.fetchall()

            self.Text4 = tk.Text(top)
            self.Text4.place(relx=0.750, rely=0.550, relheight=0.03, relwidth=0.03)
            self.Text4.configure(background="white")
            self.Text4.configure(font="-family {Segoe UI} -size 9")
            self.Text4.configure(foreground="black")
            self.Text4.configure(highlightbackground="#d9d9d9")
            self.Text4.configure(highlightcolor="black")
            self.Text4.configure(insertbackground="black")
            self.Text4.configure(selectbackground="#c4c4c4")
            self.Text4.configure(selectforeground="black")
            self.Text4.configure(wrap="word")
            self.Text4.insert(tk.END, result)
            self.Text4.tag_configure("center", justify='center')
            self.Text4.tag_add("center", 1.0, "end")
            self.Text4.config(state="disabled")

            self.Label3 = tk.Label(top)
            self.Label3.place(relx=0.30, rely=0.038, height=21, width=150)
            self.Label3.configure(background="#d9d9d9")
            self.Label3.configure(disabledforeground="#a3a3a3")
            self.Label3.configure(foreground="#000000")
            self.Label3.configure(text='''Count of tables and views''')

            cursorstr2 = ("SELECT DISTINCT TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = '" +
                          databasename + "' ORDER BY ORDINAL_POSITION;")
            self.mycursor.execute(cursorstr2)
            result = self.mycursor.fetchall()
            numoftables = len(result)

            self.Text3 = tk.Text(top)
            self.Text3.place(relx=0.45, rely=0.038, relheight=0.026, relwidth=0.03)
            self.Text3.configure(background="white")
            self.Text3.configure(font="-family {Segoe UI} -size 9")
            self.Text3.configure(foreground="black")
            self.Text3.configure(highlightbackground="#d9d9d9")
            self.Text3.configure(highlightcolor="black")
            self.Text3.configure(insertbackground="black")
            self.Text3.configure(selectbackground="#c4c4c4")
            self.Text3.configure(selectforeground="black")
            self.Text3.configure(wrap="word")
            self.Text3.insert(tk.END, numoftables)
            self.Text3.tag_configure("center", justify='center')
            self.Text3.tag_add("center", 1.0, "end")
            self.Text3.config(state="disabled")
            newnum = mynum

        def InsertRecord():
            try:
                str = ""
                str += self.TCombobox1.get()
                print(str)
                output = str.capitalize() + '_CRUD'
                print(output)
                newstr = ["INSERT"]
                print(newnum)
                for entry in entries[-newnum:]:
                    text = entry[1].get()
                    newstr.append(text)
                cursor = self.mycursor
                print(newstr)
                cursor.callproc(output, newstr)
                self.cnx.commit()
            except Exception:
                print("Insert Error")
            dolist("")

        def UpdateRecord():
            try:
                nstr = ""
                nstr += self.TCombobox1.get()
                output = nstr.capitalize() + '_CRUD'
                newstr = ["UPDATE"]
                for entry in entries[-newnum:]:
                    text = entry[1].get()
                    newstr.append(text)
                cursor = self.mycursor
                cursor.callproc(output, newstr)
                self.cnx.commit()
                entries.clear()
            except Exception:
                print("Update Error")
            dolist("")

        def DeleteRecord():
            try:
                dstr = ""
                dstr += self.TCombobox1.get()
                output = dstr.capitalize() + '_CRUD'
                newstr = ["DELETE"]
                for entry in entries[-newnum:]:
                    text = entry[1].get()
                    newstr.append(text)
                cursor = self.mycursor
                cursor.callproc(output, newstr)
                self.cnx.commit()
            except Exception:
                print("Delete Error")
            dolist("")

        cursorstr = ("SELECT DISTINCT TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = '" +
                     databasename + "' ORDER BY ORDINAL_POSITION;")

        self.mycursor.execute(cursorstr)
        result = self.mycursor.fetchall()

        self.TCombobox1 = ttk.Combobox(top, values=result)
        self.TCombobox1.current(0)

        self.TCombobox1.place(relx=0.14, rely=0.038, relheight=0.026, relwidth=0.111)
        self.TCombobox1.configure(takefocus="")
        self.TCombobox1.bind('<<ComboboxSelected>>', dolist)

        dolist("")

        self.InsertButton = tk.Button(top)
        self.InsertButton.place(relx=0.225, rely=0.403, height=24, width=120)
        self.InsertButton.configure(activebackground="#ececec")
        self.InsertButton.configure(activeforeground="#000000")
        self.InsertButton.configure(background="#d9d9d9")
        self.InsertButton.configure(disabledforeground="#a3a3a3")
        self.InsertButton.configure(foreground="#000000")
        self.InsertButton.configure(highlightbackground="#d9d9d9")
        self.InsertButton.configure(highlightcolor="black")
        self.InsertButton.configure(pady="0")
        self.InsertButton.configure(text='''Insert''')
        self.InsertButton.configure(command=(lambda: InsertRecord()))

        self.UpdateButton = tk.Button(top)
        self.UpdateButton.place(relx=0.426, rely=0.403, height=24, width=119)
        self.UpdateButton.configure(activebackground="#ececec")
        self.UpdateButton.configure(activeforeground="#000000")
        self.UpdateButton.configure(background="#d9d9d9")
        self.UpdateButton.configure(disabledforeground="#a3a3a3")
        self.UpdateButton.configure(foreground="#000000")
        self.UpdateButton.configure(highlightbackground="#d9d9d9")
        self.UpdateButton.configure(highlightcolor="black")
        self.UpdateButton.configure(pady="0")
        self.UpdateButton.configure(text='''Update''')
        self.UpdateButton.configure(command=(lambda: UpdateRecord()))

        self.DeleteButton = tk.Button(top)
        self.DeleteButton.place(relx=0.612, rely=0.403, height=24, width=124)
        self.DeleteButton.configure(activebackground="#ececec")
        self.DeleteButton.configure(activeforeground="#000000")
        self.DeleteButton.configure(background="#d9d9d9")
        self.DeleteButton.configure(disabledforeground="#a3a3a3")
        self.DeleteButton.configure(foreground="#000000")
        self.DeleteButton.configure(highlightbackground="#d9d9d9")
        self.DeleteButton.configure(highlightcolor="black")
        self.DeleteButton.configure(pady="0")
        self.DeleteButton.configure(text='''Delete''')
        self.DeleteButton.configure(command=(lambda: DeleteRecord()))

        self.Label3 = tk.Label(top)
        self.Label3.place(relx=0.700, rely=0.450, height=20, width=150)
        self.Label3.configure(background="#d9d9d9")
        self.Label3.configure(disabledforeground="#a3a3a3")
        self.Label3.configure(foreground="#000000")
        self.Label3.configure(text='''---Tables Statistics---''')


# The following code is added to facilitate the Scrolled widgets you specified.
class AutoScroll(object):
    '''Configure the scrollbars for a widget.'''

    def __init__(self, master):
        #  Rozen. Added the try-except clauses so that this class
        #  could be used for scrolled entry widget for which vertical
        #  scrolling is not supported. 5/7/14.
        try:
            vsb = ttk.Scrollbar(master, orient='vertical', command=self.yview)
        except:
            pass
        hsb = ttk.Scrollbar(master, orient='horizontal', command=self.xview)

        # self.configure(yscrollcommand=_autoscroll(vsb),
        #    xscrollcommand=_autoscroll(hsb))
        try:
            self.configure(yscrollcommand=self._autoscroll(vsb))
        except:
            pass
        self.configure(xscrollcommand=self._autoscroll(hsb))

        self.grid(column=0, row=0, sticky='nsew')
        try:
            vsb.grid(column=1, row=0, sticky='ns')
        except:
            pass
        hsb.grid(column=0, row=1, sticky='ew')

        master.grid_columnconfigure(0, weight=1)
        master.grid_rowconfigure(0, weight=1)

        # Copy geometry methods of master  (taken from ScrolledText.py)
        if py3:
            methods = tk.Pack.__dict__.keys() | tk.Grid.__dict__.keys() \
                      | tk.Place.__dict__.keys()
        else:
            methods = tk.Pack.__dict__.keys() + tk.Grid.__dict__.keys() \
                      + tk.Place.__dict__.keys()

        for meth in methods:
            if meth[0] != '_' and meth not in ('config', 'configure'):
                setattr(self, meth, getattr(master, meth))

    @staticmethod
    def _autoscroll(sbar):
        '''Hide and show scrollbar as needed.'''

        def wrapped(first, last):
            first, last = float(first), float(last)
            if first <= 0 and last >= 1:
                sbar.grid_remove()
            else:
                sbar.grid()
            sbar.set(first, last)

        return wrapped

    def __str__(self):
        return str(self.master)


def _create_container(func):
    '''Creates a ttk Frame with a given master, and use this new frame to
    place the scrollbars and the widget.'''

    def wrapped(cls, master, **kw):
        container = ttk.Frame(master)
        container.bind('<Enter>', lambda e: _bound_to_mousewheel(e, container))
        container.bind('<Leave>', lambda e: _unbound_to_mousewheel(e, container))
        return func(cls, container, **kw)

    return wrapped


class ScrolledTreeView(AutoScroll, ttk.Treeview):
    '''A standard ttk Treeview widget with scrollbars that will
    automatically show/hide as needed.'''

    @_create_container
    def __init__(self, master, **kw):
        ttk.Treeview.__init__(self, master, **kw)
        AutoScroll.__init__(self, master)


import platform


def _bound_to_mousewheel(event, widget):
    child = widget.winfo_children()[0]
    if platform.system() == 'Windows' or platform.system() == 'Darwin':
        child.bind_all('<MouseWheel>', lambda e: _on_mousewheel(e, child))
        child.bind_all('<Shift-MouseWheel>', lambda e: _on_shiftmouse(e, child))
    else:
        child.bind_all('<Button-4>', lambda e: _on_mousewheel(e, child))
        child.bind_all('<Button-5>', lambda e: _on_mousewheel(e, child))
        child.bind_all('<Shift-Button-4>', lambda e: _on_shiftmouse(e, child))
        child.bind_all('<Shift-Button-5>', lambda e: _on_shiftmouse(e, child))


def _unbound_to_mousewheel(event, widget):
    if platform.system() == 'Windows' or platform.system() == 'Darwin':
        widget.unbind_all('<MouseWheel>')
        widget.unbind_all('<Shift-MouseWheel>')
    else:
        widget.unbind_all('<Button-4>')
        widget.unbind_all('<Button-5>')
        widget.unbind_all('<Shift-Button-4>')
        widget.unbind_all('<Shift-Button-5>')


def _on_mousewheel(event, widget):
    if platform.system() == 'Windows':
        widget.yview_scroll(-1 * int(event.delta / 120), 'units')
    elif platform.system() == 'Darwin':
        widget.yview_scroll(-1 * int(event.delta), 'units')
    else:
        if event.num == 4:
            widget.yview_scroll(-1, 'units')
        elif event.num == 5:
            widget.yview_scroll(1, 'units')


def _on_shiftmouse(event, widget):
    if platform.system() == 'Windows':
        widget.xview_scroll(-1 * int(event.delta / 120), 'units')
    elif platform.system() == 'Darwin':
        widget.xview_scroll(-1 * int(event.delta), 'units')
    else:
        if event.num == 4:
            widget.xview_scroll(-1, 'units')
        elif event.num == 5:
            widget.xview_scroll(1, 'units')


if __name__ == '__main__':
    vp_start_gui()
