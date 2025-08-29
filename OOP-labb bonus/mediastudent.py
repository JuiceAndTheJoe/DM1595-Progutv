"""
Denna fil används inte i bonuslabbet, funktionalitet flyttad till ProgramStudent.
"""
from kurs import Kurs
from student import Student

class MediaStudent:
    # En mediestudent ska ha namn och en lista av avklarade kurser inom sitt program
    # Lista och dictionary för hantering av obligatoriska kurser i medieprogrammet
    _obligatoriska_kurser = [] # innehåller alla obligatoriska kurser
    _obligatoriska_kurser_dict = {} # mappar kurskod till Kurs-objekt

    # Konstruktor för MediaStudent(er)
    def __init__(self):
        self._studenter = []

    @classmethod # classmethod innebär att metoden tar classen som första argument istället för self (en instans)
    # här gör detta att alla instanser av MediaStudent kan dela på samma lista av obligatoriska kurser, undviker dataduplicering
    def las_in_obligatoriska_kurser(cls, filnamn): 
        # läser in kursinformation enligt angivet format, skapar ett Kurs-objekt och lägger till det i listan & dictionary
        with open(filnamn, encoding="utf-8") as f:
            for rad in f:
                kod, namn, poang = rad.strip().split(";")
                kurs = Kurs(kod, namn, poang) 
                cls._obligatoriska_kurser.append(kurs)
                cls._obligatoriska_kurser_dict[kod] = kurs

    def las_in_studenter(self, filnamn): # instansmetod, läser in studenter från fil - ingen classmethod behövs
        with open(filnamn, encoding="utf-8") as f:
            for rad in f:
                delar = rad.strip().split(";")
                namn = delar[0] # första elementet är namnet
                avklarade = delar[1:] # alla element efter första är kurser
                student = Student(namn, avklarade)
                self._studenter.append(student)

    @classmethod
    def get_total_obligatorisk_poang(cls):
        return sum(kurs.get_poang() for kurs in cls._obligatoriska_kurser) # summerar poäng för alla obligatoriska kurser

    def get_studenter(self):
        return self._studenter

    @classmethod
    def get_obligatoriska_kurser(cls):
        return cls._obligatoriska_kurser

    @classmethod
    def get_obligatoriska_kurser_dict(cls):
        return cls._obligatoriska_kurser_dict

    def berakna_andel_avklarade(self, student):
        avklarade_poang = sum( # summering av poäng för avklarade kurser
            self._obligatoriska_kurser_dict[kod].get_poang() # hämtar poäng för avklarade kurser
            for kod in student.get_avklarade_kurser() # hämtar alla avklarade kurser för studenten
            if kod in self._obligatoriska_kurser_dict # kontrollerar om kursen är obligatorisk
        )
        total = self.get_total_obligatorisk_poang()
        return 100 * avklarade_poang / total if total > 0 else 0.0 # beräknar andel avklarade poäng

if __name__ == "__main__":
    # Testkod, körs endast vid direkt körning av filen
    MediaStudent.las_in_obligatoriska_kurser("ObligatoriskaMediakurser.csv")
    ms = MediaStudent()
    ms.las_in_studenter("Studieresultat.csv")
    # Testa att hämta studenter, förväntar sig en lista av Student-objekt
    assert isinstance(ms.get_studenter()[0], Student)
    print("MediaStudent: Alla tester OK")
