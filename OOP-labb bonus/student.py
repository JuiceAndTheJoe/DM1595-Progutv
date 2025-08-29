class Student:
    # En godtycklig student ska ha namn och en lista av avklarade kurser
    # Konstruktor för Student
    def __init__(self, namn, avklarade_kurser):
        self._namn = namn
        self._avklarade_kurser = set(avklarade_kurser)
    
    # Getters för namn och avklarade kurser
    def get_namn(self):
        return self._namn
    def get_avklarade_kurser(self):
        return self._avklarade_kurser

if __name__ == "__main__":
    # Testkod, körs endast vid direkt körning av filen
    student = Student("Olle", ["DM1581", "SF1625"])
    assert student.get_namn() == "Olle"
    assert "DM1581" in student.get_avklarade_kurser()
    print("Student: Alla tester OK")
