"""
Program-klassen hanterar ett utbildningsprograms obligatoriska kurser.
Läser in kurser från en CSV-fil och lagrar dem i en lista.
"""

from kurs import Kurs

class Program:
    def __init__(self, namn): # Skapar ett nytt program med angivet namn.
        self.namn = namn
        self.obligatoriska_kurser = []

    def las_in_obligatoriska_kurser(self, filnamn):
        """
        Läser in obligatoriska kurser från en CSV-fil och lagrar dem i listan.
        Varje rad i filen ska ha formatet: kod;namn;poäng
        """
        with open(filnamn, encoding="utf-8") as f:
            for rad in f:
                delar = rad.strip().split(";")
                if len(delar) == 3:
                    kod, namn, poang = delar
                    kurs = Kurs(kod, namn, float(poang.replace(",", ".")))
                    self.obligatoriska_kurser.append(kurs)

    def get_obligatoriska_kurser(self):
        # Returnerar listan med obligatoriska kurser för programmet.
        return self.obligatoriska_kurser

    def get_total_obligatorisk_poang(self):
        # Returnerar den totala poängsumman för programmets obligatoriska kurser.
        return sum(kurs.get_poang() for kurs in self.obligatoriska_kurser)
