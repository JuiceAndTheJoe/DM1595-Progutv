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
    
    def get_program(self):
        return self._program
    
    def las_in_studenter(self, filnamn):
        """Läser in studenter från CSV-fil"""
        with open(filnamn, encoding="utf-8") as f:
            for rad in f:
                delar = rad.strip().split(";")
                namn = delar[0]  # Första elementet är namnet
                avklarade = delar[1:]  # Alla element efter första är kurser
                student = Student(namn, avklarade)
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
    # Testkod
    program = Program("Test")
    ps = Programstudent(program)
    print("Programstudent: Grundläggande funktionalitet OK")