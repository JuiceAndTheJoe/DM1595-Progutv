"""
ProgramStudent representerar en student som tillhör ett visst utbildningsprogram.
Hantera studieresultat och beräkna andel avklarade obligatoriska kurser för programmets kurser.
"""

from student import Student

class ProgramStudent(Student):
    def __init__(self, namn, program):
        # Skapar en student med namn och kopplar till ett program.
        super().__init__(namn)
        self.program = program

    def berakna_andel_avklarade(self):
        # Beräknar andelen avklarade obligatoriska kurser för studentens program.
        # Returnerar procentandel (float).
        # funktionalitet flyttad från MediaStudent till ProgramStudent
        avklarade_poang = 0.0
        for kurs in self.program.get_obligatoriska_kurser():
            if kurs.get_kod() in self.get_avklarade_kurser():
                avklarade_poang += kurs.get_poang()
        total_poang = self.program.get_total_obligatorisk_poang()
        if total_poang == 0:
            return 0.0
        return 100.0 * avklarade_poang / total_poang

    def get_program(self):
        # Returnerar studentens program.
        return self.program
