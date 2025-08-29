from program import Program
from programstudent import ProgramStudent

def las_in_studenter(filnamn):
    """
    Läser in studenter och deras avklarade kurser från CSV-fil.
    Returnerar en lista av dict: { 'namn': str, 'avklarade': [kurskod, ...] }
    """
    studenter = []
    with open(filnamn, encoding="utf-8") as f:
        for rad in f:
            delar = rad.strip().split(";")
            if len(delar) >= 2:
                namn = delar[0]
                avklarade = delar[1:]
                studenter.append({'namn': namn, 'avklarade': avklarade})
    return studenter

def main():
    """
    Huvudprogram för objekt-orienterad hantering av programstudenter.

    Nu hanteras både Medie- och Open-programmet via Program och ProgramStudent.
    Tidigare logik med MediaStudent är borttagen och ersatt av mer generell struktur.
    """
    # Skapa program för Media och Open
    media_program = Program("Media")
    media_program.las_in_obligatoriska_kurser("ObligatoriskaMediakurser.csv")
    open_program = Program("Open")
    open_program.las_in_obligatoriska_kurser("ObligatoriskaOpenKurser.csv")

    # Läs in studenter och deras avklarade kurser
    studenter_data = las_in_studenter("Studieresultat.csv")

    # Skapa ProgramStudent-objekt för respektive program
    mediestudenter = []
    openstudenter = []
    for data in studenter_data:
        namn = data['namn']
        avklarade = data['avklarade']
        # Här kan man avgöra programmet, t.ex. via namn eller annan logik
        # För demo: alla som har kurskod från Media-programmet blir Mediastudenter, annars Openstudenter
        if any(kod in [kurs.get_kod() for kurs in media_program.get_obligatoriska_kurser()] for kod in avklarade):
            student = ProgramStudent(namn, media_program)
        else:
            student = ProgramStudent(namn, open_program)
        # Sätt avklarade kurser
        for kod in avklarade:
            student.lagg_till_avklarad_kurs(kod)
        # Lägg till i rätt lista
        if student.get_program().namn == "Medie":
            mediestudenter.append(student)
        else:
            openstudenter.append(student)

    # Skriv ut obligatoriska kurser för båda program
    print("Alla obligatoriska kurser för Media:")
    for kurs in media_program.get_obligatoriska_kurser():
        print(f"{kurs.get_kod()} {kurs.get_namn()} {kurs.get_poang()} ECTS")
    print(f"Total obligatorisk poängsumma:  {media_program.get_total_obligatorisk_poang()} ECTS\n")

    print("Alla obligatoriska kurser för Open:")
    for kurs in open_program.get_obligatoriska_kurser():
        print(f"{kurs.get_kod()} {kurs.get_namn()} {kurs.get_poang()} ECTS")
    print(f"Total obligatorisk poängsumma:  {open_program.get_total_obligatorisk_poang()} ECTS\n")

    # Skriv ut alla studenter och deras andel avklarade kurser
    print("Alla Mediestudenter:")
    for student in mediestudenter:
        andel = student.berakna_andel_avklarade()
        print(f"{student.get_namn()} Andel avklarade:  {andel:.1f}%")

    print("Alla Openstudenter:")
    for student in openstudenter:
        andel = student.berakna_andel_avklarade()
        print(f"{student.get_namn()} Andel avklarade:  {andel:.1f}%")

if __name__ == "__main__":
    main()
