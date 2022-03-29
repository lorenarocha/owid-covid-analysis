import src.download_file as download_file
import src.import_database as import_database
from src.pbi_refresh import Refresher

refresher = Refresher()

def main():

    download_file.main()
    import_database.main()
    refresher.open_pbi('E:\_workspace\owid-covid-analysis\DashCovid-19.pbix')

if __name__ == '__main__':
    main()