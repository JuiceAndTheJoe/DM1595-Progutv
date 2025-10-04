from mediastudent import MediaStudent
import os

def main():
    """
    Huvudprogram för Objekt-orienterad hantering av mediestudenter.

    Läser in obligatoriska kurser och studentresultat från CSV-filer,
    beräknar andelen avklarade kurser för varje student och skriver ut resultaten.
    """
    # Få sökvägen till mappen där detta script ligger
    script_dir = os.path.dirname(os.path.abspath(__file__))
    
    # Skapa absoluta sökvägar till CSV-filerna
    obligatoriska_kurser_fil = os.path.join(script_dir, "ObligatoriskaMediaKurser.csv")
    studieresultat_fil = os.path.join(script_dir, "Studieresultat.csv")
    
    MediaStudent.las_in_obligatoriska_kurser(obligatoriska_kurser_fil)
    ms = MediaStudent() # skapar en instans av MediaStudent
    ms.las_in_studenter(studieresultat_fil) # läser in studenter, deras avklarade kurser och poäng

    print("Alla obligatoriska kurser:") # skriver ut alla obligatoriska kurser
    for kurs in MediaStudent.get_obligatoriska_kurser():
        print(f"{kurs.get_kod()} {kurs.get_namn()} {kurs.get_poang()} ECTS")
    print(f"Total obligatorisk poängsumma:  {MediaStudent.get_total_obligatorisk_poang()} ECTS\n")

    print("Alla studenter:") # skriver ut alla studenter i klassen MediaStudent
    for student in ms.get_studenter():
        andel = ms.berakna_andel_avklarade(student)
        print(f"{student.get_namn()} Andel avklarade:  {andel:.1f}%")

if __name__ == "__main__":
    main()
