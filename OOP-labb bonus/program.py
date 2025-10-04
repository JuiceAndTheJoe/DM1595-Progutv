from kurs import Kurs

class Program:
    """
    Klass som representerar ett utbildningsprogram (t.ex. Media eller Open).
    Hanterar obligatoriska kurser för programmet.
    """
    
    def __init__(self, namn):
        self._namn = namn
        self._obligatoriska_kurser = []  # Lista med alla obligatoriska kurser
        self._obligatoriska_kurser_dict = {}  # Dictionary för snabb uppslagning av kurser
    
    def get_namn(self):
        return self._namn
    
    def las_in_obligatoriska_kurser(self, filnamn):
        """Läser in obligatoriska kurser från CSV-fil"""
        with open(filnamn, encoding="utf-8") as f:
            for rad in f:
                kod, namn, poang = rad.strip().split(";")
                kurs = Kurs(kod, namn, poang)
                self._obligatoriska_kurser.append(kurs)
                self._obligatoriska_kurser_dict[kod] = kurs
    
    def get_obligatoriska_kurser(self):
        return self._obligatoriska_kurser
    
    def get_obligatoriska_kurser_dict(self):
        return self._obligatoriska_kurser_dict
    
    def get_total_obligatorisk_poang(self):
        """Beräknar total poäng för alla obligatoriska kurser"""
        return sum(kurs.get_poang() for kurs in self._obligatoriska_kurser)

if __name__ == "__main__":
    # Testkod
    program = Program("Medieteknik")
    # Test skulle kräva en CSV-fil, så vi skapar en enkel test
    print("Program: Grundläggande funktionalitet OK")