from kurs import Kurs

class Program:
    """
    Klass som representerar ett utbildningsprogram.
    Hanterar obligatoriska kurser för programmet.
    """
    
    def __init__(self, namn):
        self._namn = namn               # Namn på programmet
        self._obligatoriska_kurser = []  # Lista med alla obligatoriska kurser
        self._obligatoriska_kurser_dict = {}  # Dictionary för snabb uppslagning av kurser
    
    def get_namn(self):
        return self._namn
    
    def las_in_obligatoriska_kurser(self, filnamn):
        """Läser in obligatoriska kurser från CSV-fil"""
        with open(filnamn, encoding="utf-8") as f:
            for rad in f: # Loopar genom varje rad i filen, lägger till varje kurs i både lista och dictionary
                kod, namn, poang = rad.strip().split(";")
                kurs = Kurs(kod, namn, poang)
                self._obligatoriska_kurser.append(kurs)
                self._obligatoriska_kurser_dict[kod] = kurs
    
    def get_total_obligatorisk_poang(self):
        """Beräknar total poäng för alla obligatoriska kurser"""
        return sum(kurs.get_poang() for kurs in self._obligatoriska_kurser)

if __name__ == "__main__":
    import os
    
    # Få sökvägen till mappen där detta script ligger
    script_dir = os.path.dirname(os.path.abspath(__file__))
    
    # Skapa absoluta sökvägar till CSV-filerna
    media_kurser_fil = os.path.join(script_dir, "ObligatoriskaMediaKurser.csv")
    open_kurser_fil = os.path.join(script_dir, "ObligatoriskaOpenKurser.csv")
    
    # Skapa ett Media-program
    print("Testar Program-klassen med Media-kurser...")
    media_program = Program("Media")
    try:
        media_program.las_in_obligatoriska_kurser(media_kurser_fil)
        print("Skapandet av Media-program och inläsning av kurser fungerade.")        
    except FileNotFoundError as e:
        print(f"Kunde inte hitta Media CSV-filen: {e}")