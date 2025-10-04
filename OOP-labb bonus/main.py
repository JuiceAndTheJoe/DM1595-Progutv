from program import Program
from programstudent import Programstudent
import os

def main():
    """
    Huvudprogram för hantering av studenter från olika program (Media och Open).

    Läser in obligatoriska kurser och studentresultat från CSV-filer,
    beräknar andelen avklarade kurser för varje student och skriver ut resultaten.
    """
    # Få sökvägen till mappen där detta script ligger
    script_dir = os.path.dirname(os.path.abspath(__file__))
    
    # Skapa absoluta sökvägar till CSV-filerna
    media_kurser_fil = os.path.join(script_dir, "ObligatoriskaMediaKurser.csv")
    open_kurser_fil = os.path.join(script_dir, "ObligatoriskaOpenKurser.csv")
    studieresultat_fil = os.path.join(script_dir, "Studieresultat.csv")
    
    # Skapa Media-program och läs in obligatoriska kurser
    media_program = Program("Media")
    media_program.las_in_obligatoriska_kurser(media_kurser_fil)
    
    # Skapa Open-program och läs in obligatoriska kurser  
    open_program = Program("Open")
    open_program.las_in_obligatoriska_kurser(open_kurser_fil)
    
    # Skapa programstudenter för båda programmen
    media_studenter = Programstudent(media_program)
    media_studenter.las_in_studenter(studieresultat_fil)
    
    open_studenter = Programstudent(open_program)
    open_studenter.las_in_studenter(studieresultat_fil)
    
    # Skriv ut resultat för Mediestudenter
    print("Mediestudenter:")
    for student in media_studenter.get_studenter():
        andel = media_studenter.berakna_andel_avklarade(student)
        print(f"{student.get_namn()}  Andel avklarade:  {andel:.1f}%")
    
    print()  # Tom rad
    
    # Skriv ut resultat för Openstudenter
    print("Openstudenter:")
    for student in open_studenter.get_studenter():
        andel = open_studenter.berakna_andel_avklarade(student)
        print(f"{student.get_namn()}  Andel avklarade:  {andel:.1f}%")

if __name__ == "__main__":
    main()
