import sqlite3

conn = sqlite3.connect('contacts.db')
cursor = conn.cursor()

cursor.execute('''
CREATE TABLE IF NOT EXISTS contacts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    phone TEXT NOT NULL,
    email TEXT NOT NULL
)
''')
conn.commit()

def add_contact():
    name = input("Enter name: ")
    phone = input("Enter phone number: ")
    email = input("Enter email address: ")
    cursor.execute("INSERT INTO contacts (name, phone, email) VALUES (?, ?, ?)", (name, phone, email))
    conn.commit()
    print("Contact added successfully.\n")

def view_contacts():
    cursor.execute("SELECT * FROM contacts")
    rows = cursor.fetchall()
    if rows:
        print("\n All Contacts:")
        for row in rows:
            print(f"ID: {row[0]}, Name: {row[1]}, Phone: {row[2]}, Email: {row[3]}")
        print()
    else:
        print("\n No contacts found.\n")

def update_contact():
    contact_id = input("Enter contact ID to update: ")
    cursor.execute("SELECT * FROM contacts WHERE id=?", (contact_id,))
    result = cursor.fetchone()
    if result:
        new_name = input(f"Enter new name (current: {result[1]}): ") or result[1]
        new_phone = input(f"Enter new phone (current: {result[2]}): ") or result[2]
        new_email = input(f"Enter new email (current: {result[3]}): ") or result[3]
        cursor.execute("UPDATE contacts SET name=?, phone=?, email=? WHERE id=?", 
                       (new_name, new_phone, new_email, contact_id))
        conn.commit()
        print(" Contact updated successfully.\n")
    else:
        print(" Contact not found.\n")

def delete_contact():
    contact_id = input("Enter contact ID to delete: ")
    cursor.execute("SELECT * FROM contacts WHERE id=?", (contact_id,))
    result = cursor.fetchone()
    if result:
        confirm = input(f"Are you sure you want to delete {result[1]}? (y/n): ").lower()
        if confirm == 'y':
            cursor.execute("DELETE FROM contacts WHERE id=?", (contact_id,))
            conn.commit()
            print("🗑️ Contact deleted.\n")
    else:
        print(" Contact not found.\n")

def menu():
    while True:
        print("=== Personal Contact Book ===")
        print("1. Add Contact")
        print("2. View All Contacts")
        print("3. Update Contact")
        print("4. Delete Contact")
        print("5. Exit")
        choice = input("Choose an option (1-5): ")

        if choice == '1':
            add_contact()
        elif choice == '2':
            view_contacts()
        elif choice == '3':
            update_contact()
        elif choice == '4':
            delete_contact()
        elif choice == '5':
            print(" Goodbye!")
            break
        else:
            print("Invalid option. Please try again.\n")

if __name__ == "__main__":
    menu()
    conn.close()