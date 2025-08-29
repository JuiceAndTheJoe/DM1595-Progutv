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

# Testkörning och assert-tester för Program
if __name__ == "__main__":
    # Skapa ett testprogram och lägg till kurser manuellt
    p = Program("Testprogram")
    p.obligatoriska_kurser.append(Kurs("K1", "Testkurs1", 5.0))
    p.obligatoriska_kurser.append(Kurs("K2", "Testkurs2", 7.5))
    # testar att hämta obligatoriska kurser och beräkna total poäng
    assert len(p.get_obligatoriska_kurser()) == 2, "Antal kurser ska vara 2"
    assert p.get_total_obligatorisk_poang() == 12.5, "Total poäng ska vara 12.5"
    print("Alla Program-tester OK!")
