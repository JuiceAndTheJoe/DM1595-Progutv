from student import Student
from program import Program

class Programstudent:
    """
    Klass som hanterar studenter inom ett specifikt program.
    Kopplar ihop studenter med deras program.
    """
    
    def __init__(self, program):
        self._program = program
        self._studenter = []
    
    def las_in_studenter(self, filnamn):
        """Läser in studenter från CSV-fil"""
        with open(filnamn, encoding="utf-8") as f:
            for rad in f:
                delar = rad.strip().split(";")
                namn = delar[0]  # Första elementet är namnet
                avklarade = delar[1:]  # Alla element efter första är kurser
                student = Student(namn, avklarade) # Skapa studentobjekt med denna info
                self._studenter.append(student)
    
    def get_studenter(self):
        return self._studenter
    
    def berakna_andel_avklarade(self, student):
        """
        Beräknar andel avklarade kurser för en student baserat på programmets obligatoriska kurser.
        """
        obligatoriska_kurser_dict = self._program.get_obligatoriska_kurser_dict()
        
        avklarade_poang = sum(
            obligatoriska_kurser_dict[kod].get_poang()
            for kod in student.get_avklarade_kurser()
            if kod in obligatoriska_kurser_dict
        )
        
        total = self._program.get_total_obligatorisk_poang()
        return 100 * avklarade_poang / total if total > 0 else 0.0

if __name__ == "__main__":
    import os

    # Få sökvägen till mappen där detta script ligger
    script_dir = os.path.dirname(os.path.abspath(__file__))
    
    # Skapa absoluta sökvägar till CSV-filerna
    media_kurser_fil = os.path.join(script_dir, "ObligatoriskaMediaKurser.csv")
    studieresultat_fil = os.path.join(script_dir, "Studieresultat.csv")
    
    try:
        # Testar att skapa Media-program och programstudenter
        media_program = Program("Media")
        media_program.las_in_obligatoriska_kurser(media_kurser_fil)
        
        media_studenter = Programstudent(media_program)
        media_studenter.las_in_studenter(studieresultat_fil)
        
        # Testa beräkning av andel avklarade för varje student
        for student in media_studenter.get_studenter():
            andel = media_studenter.berakna_andel_avklarade(student)
            print(f"  {student.get_namn()}: {andel:.1f}%")
        print("Allt funkar!")        
    except FileNotFoundError as e:
        print(f"Kunde inte hitta en CSV-fil: {e}")
    except Exception as e:
        print(f"Ett oväntat fel inträffade: {e}")

