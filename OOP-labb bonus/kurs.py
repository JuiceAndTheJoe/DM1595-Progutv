class Kurs:
    # Konstruktor för kursklassen
    def __init__(self, kod, namn, poang):
        self._kod = kod
        self._namn = namn
        self._poang = float(poang)

    # Skapar getters för kursens attributer
    def get_kod(self):
        return self._kod
    def get_namn(self):
        return self._namn
    def get_poang(self):
        return self._poang

if __name__ == "__main__":
    # Testkod, körs endast vid direkt körning av filen
    kurs = Kurs("DM1581", "Introduktion till medieteknik", 6.0)
    assert kurs.get_kod() == "DM1581"
    assert kurs.get_namn() == "Introduktion till medieteknik"
    assert kurs.get_poang() == 6.0
    print("Kurs: Alla tester OK")
