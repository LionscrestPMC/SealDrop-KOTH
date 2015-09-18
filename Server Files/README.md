INSTALLATION STEPS
==================

#### GERMAN & ENGLISH



#### Schritt 1

Den Ordner "SD_KOTH.Altis" in den MPMissions des Servers kopieren

#### Schritt 2

Den Ordner "@kothServer" in das Hauptverzeichnis des Servers kopieren

#### Schritt 3

Jetzt loggt ihr euch mit PhpMyAdmin ein und legt eine neue Datenbank an

#### Schritt 4

Nun wird in der neu erstellten Datenbank die "database.sql" importiert

#### Schritt 5

Nun folgende Dateien in das Hauptverzeichnis des Servers kopieren: 

	- extDB-conf.ini
	- extDB.dll
	- tbb.dll
	- tbbmalloc.dll

#### Schritt 6

In die "extDB-conf.ini" müssen jetzt die Datenbankverbindungsparameter eingetragen werden

#### Schritt 7

Jetzt noch die Arma 3 Server Startparameter anpassen. Dazu folgendes hinzufügen:

	Windows:
		-mod=@kothServer oder -serverMod=@kothServer

	Linux:
	  -mod=@kothServer oder -serverMod=@kothServer
