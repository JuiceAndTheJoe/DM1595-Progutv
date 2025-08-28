from mediastudent import MediaStudent

def main():
    """
    Huvudprogram för Objekt-orienterad hantering av mediestudenter.

    Läser in obligatoriska kurser och studentresultat från CSV-filer,
    beräknar andelen avklarade kurser för varje student och skriver ut resultaten.
    """
    MediaStudent.las_in_obligatoriska_kurser("ObligatoriskaMediakurser.csv")
    ms = MediaStudent() # skapar en instans av MediaStudent
    ms.las_in_studenter("Studieresultat.csv") # läser in studenter, deras avklarade kurser och poäng

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
