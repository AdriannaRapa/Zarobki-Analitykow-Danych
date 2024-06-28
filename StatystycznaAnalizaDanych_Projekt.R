#Opis użytych danych:
#źródło: https://www.kaggle.com/datasets/zain280/data-science-salaries/data
#Dane dotyczą zarobków w zawodzie analityka danych, na różnych stanowiskach,
#miejsca pracy, wielkości firm które zatrudniają analityków, możliwości pracy zdalnej, rodzaju zatrudnienia oraz poziom doświadczenia i czas zatrudnienia.                  


#Każdy wiersz w tabeli reprezentuje jednego pracownika/analityka danych, a więc jest to pojedynczy element w próbie.
#Próba składa się z kolei ze wszystkich tych rekordów, które zostały zebrane i przetworzone w celu analizy statystycznej.
#Cechy w tabeli wynagrodzenia_AD odnoszą się do poszczególnych atrybutów lub zmiennych, które są opisane dla każdej obserwacji w próbie. W tym przypadku cechy mogą obejmować:
'Stanowisko: Określa konkretne zajmowane stanowisko przez analityka danych.
Wynagrodzenie_w_USD: Jest to wynagrodzenie wyrażone w dolarach amerykańskich, co stanowi jedną z kluczowych cech badanych w analizie.
PoziomDoświadczenia: Określa poziom doświadczenia pracownika, czyli czy jest początkujący, średnio zaawansowany, doświadczony czy starszy.
RokPracy: Rok, w którym dana obserwacja dotycząca wynagrodzenia została zebrana.
W tej tabeli każda obserwacja (wiersz) reprezentuje pojedynczego pracownika/analityka danych, a cechy (kolumny) opisują różne aspekty związane z ich zatrudnieniem i wynagrodzeniem.
'

#wczytywanie bazy danych z pliku csv
AD_wynagrodzenia <- read.csv("C:/Users/adria/Desktop/STUDIA/.IV SEMESTR/STATYSTYCZNA ANALIZA DANYCH !!/PROJEKT/ds_salaries.csv")


#usunięcie pierwszej kolumny
AD_wynagrodzenia <- AD_wynagrodzenia[, -1]


#zmiana nagłówków kolumn
# Nowe nazwy kolumn
nowe_nazwy_kolumn <- c("RokPracy", "PoziomDoświadczenia", "RodzajZatrudnienia", "Stanowisko", "Wynagrodzenie", "WalutaWynagrodzenia", 
                "Wynagrodzenie_w_USD", "MiejsceZamieszkaniaPracownika", "PracaZdalna", "MiejsceFirmy", "RozmiarFirmy")


#przypisanie nowych kolumn
colnames(AD_wynagrodzenia) <- nowe_nazwy_kolumn


#dekodowanie nazwy krajów
install.packages("countrycode")
library(countrycode)


#Dekodowanie kodów państw na angielskie nazwy
AD_wynagrodzenia$MiejsceZamieszkaniaPracownika <- countrycode(AD_wynagrodzenia$MiejsceZamieszkaniaPracownika, "iso2c", "country.name")
AD_wynagrodzenia$MiejsceFirmy <- countrycode(AD_wynagrodzenia$MiejsceFirmy, "iso2c", "country.name")


AD_wynagrodzenia$MiejsceFirmy <- factor(AD_wynagrodzenia$MiejsceFirmy, 
                                      levels = c("United States", "Poland", "Germany", "India", "United Kingdom", "Canada", "France", "Brazil", "Australia", "Spain",
                                                   "Netherlands", "Italy", "Japan", "China", "Russia", "South Korea", "Mexico", "Switzerland", "Israel", "Sweden",
                                                   "Turkey", "Argentina", "South Africa", "Singapore", "Belgium", "Norway", "Austria", "Ireland", "Denmark", "Finland",
                                                   "Portugal", "New Zealand", "Greece", "Malaysia", "Chile", "Colombia", "Peru", "Thailand", "Philippines", "Ukraine",
                                                   "Czechia", "Saudi Arabia", "Egypt", "Vietnam", "Pakistan", "Romania", "Hungary", "Croatia", "Luxembourg", "Slovakia",
                                                   "Estonia", "Bulgaria", "Slovenia", "Lithuania", "Latvia", "Malta", "Cyprus", "Iceland", "Belarus", "Serbia", "Bosnia and Herzegovina",
                                                   "Montenegro", "Georgia", "Moldova", "Kazakhstan", "Armenia", "Azerbaijan", "Nigeria", "Honduras", "United Arab Emirates", 
                                                 "Iraq", "Kenya","Algeria", "Iran", "India", "American Samoa"),
                                      labels = c("Stany Zjednoczone", "Polska", "Niemcy", "Indie", "Wielka Brytania", "Kanada", "Francja", "Brazylia", "Australia", "Hiszpania",
                                                 "Holandia", "Włochy", "Japonia", "Chiny", "Rosja", "Korea Południowa", "Meksyk", "Szwajcaria", "Izrael", "Szwecja",
                                                 "Turcja", "Argentyna", "Republika Południowej Afryki", "Singapur", "Belgia", "Norwegia", "Austria", "Irlandia", "Dania", "Finlandia",
                                                 "Portugalia", "Nowa Zelandia", "Grecja", "Malezja", "Chile", "Kolumbia", "Peru", "Tajlandia", "Filipiny", "Ukraina",
                                                 "Czechy", "Arabia Saudyjska", "Egipt", "Wietnam", "Pakistan", "Rumunia", "Węgry", "Chorwacja", "Luksemburg", "Słowacja",
                                                 "Estonia", "Bułgaria", "Słowenia", "Litwa", "Łotwa", "Malta", "Cypr", "Islandia", "Białoruś", "Serbia", "Bośnia i Hercegowina",
                                                 "Czarnogóra", "Gruzja", "Mołdawia", "Kazachstan", "Armenia", "Azerbejdżan", "Nigeria", "Honduras", "Zjednoczone Emiraty Arabskie", 
                                                 "Irak", "Kenia", "Algeria", "Iran","Indie", "Samoa Amerykańskie"))



AD_wynagrodzenia$MiejsceZamieszkaniaPracownika <- factor(AD_wynagrodzenia$MiejsceZamieszkaniaPracownika, 
                                        levels = c("United States", "Poland", "Germany", "India", "United Kingdom", "Canada", "France", "Brazil", "Australia", "Spain",
                                                   "Netherlands", "Italy", "Japan", "China", "Russia", "South Korea", "Mexico", "Switzerland", "Israel", "Sweden",
                                                   "Turkey", "Argentina", "South Africa", "Singapore", "Belgium", "Norway", "Austria", "Ireland", "Denmark", "Finland",
                                                   "Portugal", "New Zealand", "Greece", "Malaysia", "Chile", "Colombia", "Peru", "Thailand", "Philippines", "Ukraine",
                                                   "Czechia", "Saudi Arabia", "Egypt", "Vietnam", "Pakistan", "Romania", "Hungary", "Croatia", "Luxembourg", "Slovakia",
                                                   "Estonia", "Bulgaria", "Slovenia", "Lithuania", "Latvia", "Malta", "Cyprus", "Iceland", "Belarus", "Serbia", "Bosnia and Herzegovina",
                                                   "Montenegro", "Georgia", "Moldova", "Kazakhstan", "Armenia", "Azerbaijan", "Nigeria", "Honduras", "United Arab Emirates", "Iraq", "Kenya","Algeria", "Iran", "India", "American Samoa"),
                                        labels = c("Stany Zjednoczone", "Polska", "Niemcy", "Indie", "Wielka Brytania", "Kanada", "Francja", "Brazylia", "Australia", "Hiszpania",
                                                   "Holandia", "Włochy", "Japonia", "Chiny", "Rosja", "Korea Południowa", "Meksyk", "Szwajcaria", "Izrael", "Szwecja",
                                                   "Turcja", "Argentyna", "Republika Południowej Afryki", "Singapur", "Belgia", "Norwegia", "Austria", "Irlandia", "Dania", "Finlandia",
                                                   "Portugalia", "Nowa Zelandia", "Grecja", "Malezja", "Chile", "Kolumbia", "Peru", "Tajlandia", "Filipiny", "Ukraina",
                                                   "Czechy", "Arabia Saudyjska", "Egipt", "Wietnam", "Pakistan", "Rumunia", "Węgry", "Chorwacja", "Luksemburg", "Słowacja",
                                                   "Estonia", "Bułgaria", "Słowenia", "Litwa", "Łotwa", "Malta", "Cypr", "Islandia", "Białoruś", "Serbia", "Bośnia i Hercegowina",
                                                   "Czarnogóra", "Gruzja", "Mołdawia", "Kazachstan", "Armenia", "Azerbejdżan", "Nigeria", "Honduras", "Zjednoczone Emiraty Arabskie", "Irak", "Kenia", "Algeria", "Iran","Indie", "Samoa Amerykańskie"))



#Zmiana angielskich nazw stanowisk na polskie tłumaczenia
AD_wynagrodzenia$Stanowisko <- factor(AD_wynagrodzenia$Stanowisko,
                                      levels = c("3D Computer Vision Researcher", "AI Scientist", "Analytics Engineer", "Applied Data Scientist",
                                                 "Applied Machine Learning Scientist", "BI Data Analyst", "Big Data Architect", "Big Data Engineer", 
                                                 "Business Data Analyst", "Cloud Data Engineer", "Computer Vision Engineer", "Computer Vision Software Engineer",
                                                 "Data Analyst", "Data Analytics Engineer", "Data Analytics Lead", "Data Analytics Manager", 
                                                 "Data Architect", "Data Engineer", "Data Engineering Manager", "Data Science Consultant", "Data Science Engineer",
                                                "Data Science Manager", "Data Scientist", "Data Specialist", "Director of Data Engineering", "Director of Data Science",
                                                 "ETL Developer", "Finance Data Analyst", "Financial Data Analyst", "Head of Data", "Head of Data Science",
                                                 "Head of Machine Learning", "Lead Data Analyst", "Lead Data Engineer", "Lead Data Scientist", "Lead Machine Learning Engineer",
                                                 "Machine Learning Developer", "Machine Learning Engineer", "Machine Learning Infrastructure Engineer", 
                                                 "Machine Learning Manager", "Machine Learning Scientist", "Marketing Data Analyst", "ML Engineer", "NLP Engineer",
                                                 "Principal Data Analyst", "Principal Data Engineer", "Principal Data Scientist", "Product Data Analyst", 
                                                 "Research Scientist", "Staff Data Scientist"),
                                      labels = c("Badacz Wizji Komputerowej 3D", "Naukowiec Sztucznej Inteligencji", "Inżynier Analityki", "Analityk Danych Stosowanych",
                                                 " Praktykujący naukowiec ds. uczenia maszynowego", "Analityk biznesowy", "Architekt Big Data", "Inżynier Big Data", 
                                                 "Analityk Danych Biznesowych", "Inżynier Danych w Chmurze", "Inżynier Wizji Komputerowej", "Inżynier Oprogramowania Wizji Komputerowej",
                                                 "Analityk Danych", "Inżynier Analityki Danych", "Lider Analityki Danych", "Menedżer Analityki Danych", 
                                                 "Architekt Danych", "Inżynier Danych", "Menedżer Inżynierii Danych", "Konsultant Analizy Danych", "Inżynier Analizy Danych",
                                                 "Menadżer Analizy Danych", "Analityk Danych", "Specjalista Danych", "Dyrektor Inżynierii Danych", "Dyrektor Analizy Danych",
                                                 "Programista ETL", "Analityk Finansowy", "Analityk Finansowy", "Kierownik Danych", "kierownik Analizy Danych",
                                                 "Kierownik Uczenia Maszynowego", "Lider Analizy Danych", "Lider Inżynieri Danych", "Lider Analityków Danych", "Lider Inżynierii Uczenia Maszynowego",
                                                 "programista Uczenia Maszynowego", "Inżynier Uczenia Maszynowego", "Inżynier Infrastruktury Uczenia Maszynowego", 
                                                 "Menedżer Uczenia Maszynowego", "Specjalista Uczenia Maszynowego" , "Analityk Danych Marketingowych", "Inżynier uczenia maszynowegor", "Inżynier przetwarzania języka naturalnego",
                                                 "Główny Analityk Danych", "Główny Inżynier Danych", "Główny Analityk Danych", "Analityk Danych Produktowych", 
                                                 "Badacz Naukowy", "Analityk Danych Pracowników"))


#Zmiana angielskich skrótów na polskie - poziom doświadczenia
AD_wynagrodzenia$PoziomDoświadczenia <- factor(AD_wynagrodzenia$PoziomDoświadczenia,
                                               levels = c("EN", "MI", "SE", "EX"),
                                               labels = c("Początkujący", "Średnio zaawansowany", "Zaawansowany", "Doświadczony"))


#Zmiana angielskich skrótów na polskie - rozmiar firmy
AD_wynagrodzenia$RozmiarFirmy <- factor(AD_wynagrodzenia$RozmiarFirmy,
                                         levels = c("S", "M", "L"),
                                         labels = c("Mała", "Średnia", "Duża"))


#Zmiana angielskich skrótów na polskie - rodzaj zatrudnienia
AD_wynagrodzenia$RodzajZatrudnienia <- factor(AD_wynagrodzenia$RodzajZatrudnienia,
                                              levels = c("CT", "FL", "FT", "PT"),
                                              labels = c("Umowa kontraktowa", "Freelancer", "Pełny etat", "Część etatu"))


#Utworzenie ramki danych bez wybranych kolumn
wynagrodzenia_AD <- subset(AD_wynagrodzenia, select = -c(Wynagrodzenie, WalutaWynagrodzenia, PracaZdalna, RokPracy, MiejsceZamieszkaniaPracownika, RozmiarFirmy, RodzajZatrudnienia))


#Wyświetlenie nowej ramki danych
print(wynagrodzenia_AD)


#Wybierz kolumny w nowej kolejności
wynagrodzenia_AD <- subset(wynagrodzenia_AD, select = c(Stanowisko, Wynagrodzenie_w_USD, PoziomDoświadczenia, MiejsceFirmy))


##usuwanie odstających wartości
#Obliczanie średniej i odchylenia standardowego wynagrodzeń
srednia_wynagrodzen <- mean(wynagrodzenia_AD$Wynagrodzenie_w_USD)
print(srednia_wynagrodzen)
odchylenie_std_wynagrodzen <- sd(wynagrodzenia_AD$Wynagrodzenie_w_USD)
print(odchylenie_std_wynagrodzen)


#Zdefiniowanie granicy odstających wartości jako 3 odchylenia standardowe od średniej
granica <- 3 * odchylenie_std_wynagrodzen
print(granica)


#Usunięcie odstających wartości z bazy danych
wynagrodzenia_AD_clean <- wynagrodzenia_AD[abs(wynagrodzenia_AD$Wynagrodzenie_w_USD - srednia_wynagrodzen) < granica, ]

print(wynagrodzenia_AD[!rownames(wynagrodzenia_AD) %in% rownames(wynagrodzenia_AD_clean), ])


#Znajdowanie indeksów wierszy usuniętych
indeksy_usunietych <- which(abs(wynagrodzenia_AD$Wynagrodzenie_w_USD - srednia_wynagrodzen) >= granica)


#Tworzenie ramki danych z usuniętymi wierszami
usuniete_wiersze <- wynagrodzenia_AD[indeksy_usunietych, ]


#Usunięcie odstających wartości z ramki danych wynagrodzenia_AD
wynagrodzenia_AD <- wynagrodzenia_AD[abs(wynagrodzenia_AD$Wynagrodzenie_w_USD - srednia_wynagrodzen) < granica, ]


#Znalezienie indeksów wartości wynagrodzeń powyżej 30 000
indeksy_wysokich_wynagrodzen <- wynagrodzenia_AD$Wynagrodzenie_w_USD > 30000

#Podzielenie wysokich wynagrodzeń przez 12 i zaokrąglenie do najbliższej całkowitej liczby
wynagrodzenia_AD$Wynagrodzenie_w_USD[indeksy_wysokich_wynagrodzen] <- 
  round(wynagrodzenia_AD$Wynagrodzenie_w_USD[indeksy_wysokich_wynagrodzen] / 12)






# Wyznaczenie podstawowych parametrów opisowych dla ramki danych wynagrodzenia_AD

#Średnia
srednia <- mean(wynagrodzenia_AD$Wynagrodzenie_w_USD)
cat("Średnia: ", srednia, "\n")


#Odchylenie standardowe
odchylenie_std <- sd(wynagrodzenia_AD$Wynagrodzenie_w_USD)
cat("Odchylenie standardowe: ", odchylenie_std, "\n")


#Mediana
mediana <- median(wynagrodzenia_AD$Wynagrodzenie_w_USD)
cat("Mediana: ", mediana, "\n")


#Dominanta
dominanta <- names(sort(table(wynagrodzenia_AD$Wynagrodzenie_w_USD), decreasing = TRUE))[1]
cat("Dominanta: ", dominanta, "\n")


#Rozstęp
rozstep <- max(wynagrodzenia_AD$Wynagrodzenie_w_USD) - min(wynagrodzenia_AD$Wynagrodzenie_w_USD)
cat("Rozstęp: ", rozstep, "\n")


#Kwartyle
kwartyle <- quantile(wynagrodzenia_AD$Wynagrodzenie_w_USD)
cat("Kwartyle: ", kwartyle, "\n")


#Minimum
minimum <- min(wynagrodzenia_AD$Wynagrodzenie_w_USD)
cat("Minimum: ", minimum, "\n")


#Maksimum
maksimum <- max(wynagrodzenia_AD$Wynagrodzenie_w_USD)
cat("Maksimum: ", maksimum, "\n")


#Wariancja
wariancja <- var(wynagrodzenia_AD$Wynagrodzenie)
cat("Wariancja: ", wariancja, "\n")


#Współczynnik zmienności
wspolczynnik_zmiennosci <- odchylenie_std / srednia * 100
cat("Współczynnik zmienności: ", wspolczynnik_zmiennosci, "%\n")


#Momenty centralne
#Pierwszy moment centralny (powinien być bliski zera)
moment_centralny_1 <- sum((wynagrodzenia_AD$Wynagrodzenie - srednia)^1) / length(wynagrodzenia_AD$Wynagrodzenie)
cat("Pierwszy moment centralny: ", moment_centralny_1, "\n")

#Drugi moment centralny (to odchylenie standardowe)
moment_centralny_2 <- sum((wynagrodzenia_AD$Wynagrodzenie - srednia)^2) / length(wynagrodzenia_AD$Wynagrodzenie)
cat("Drugi moment centralny (odchylenie standardowe): ", moment_centralny_2, "\n")

#Trzeci moment centralny
moment_centralny_3 <- sum((wynagrodzenia_AD$Wynagrodzenie - srednia)^3) / length(wynagrodzenia_AD$Wynagrodzenie)
cat("Trzeci moment centralny: ", moment_centralny_3, "\n")

#Czwarty moment centralny (to kurtoza)
moment_centralny_4 <- sum((wynagrodzenia_AD$Wynagrodzenie - srednia)^4) / length(wynagrodzenia_AD$Wynagrodzenie)
cat("Czwarty moment centralny (kurtoza): ", moment_centralny_4, "\n")

#Współczynnik asymetrii
wspolczynnik_asymetrii <- sum((wynagrodzenia_AD$Wynagrodzenie - srednia)^3) / (length(wynagrodzenia_AD$Wynagrodzenie) * odchylenie_std^3)
cat("Współczynnik asymetrii: ", wspolczynnik_asymetrii, "\n")

#Wskaźnik asymetrii z wykorzystaniem współczynnika asymetrii
if (wspolczynnik_asymetrii > 0) {
  cat("Rozkład prawoskośny (skośność w prawo).\n")
} else if (wspolczynnik_asymetrii < 0) {
  cat("Rozkład lewoskośny (skośność w lewo).\n")
} else {
  cat("Rozkład symetryczny.\n")
}







#Graficzna prezentacja danych
# Zainstalowanie i załadowanie pakietów
install.packages("ggplot2")
library(ggplot2)

### WYKRES KOŁOWY
#Liczba analityków danych dla każdego poziomu doświadczenia
doswiadczenie_counts <- table(wynagrodzenia_AD$PoziomDoświadczenia)

#Przekształcenie do data frame
doswiadczenie_df <- as.data.frame(doswiadczenie_counts)
colnames(doswiadczenie_df) <- c("PoziomDoświadczenia", "LiczbaAnalitykow")

#Paleta kolorów
paleta_kolorow <- c("#FF9999", "#ffcc33", "#cc66ff", "#9999ff")

#Wykres kołowy
wykres_kolowy <- ggplot(doswiadczenie_df, aes(x = "", y = LiczbaAnalitykow, fill = PoziomDoświadczenia)) +
  geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +  # Dodanie czarnych obramowań
  coord_polar(theta = "y") +
  labs(title = "Liczba analityków danych dla każdego poziomu doświadczenia", x = NULL, y = NULL) +
  theme_minimal() +
  theme(axis.text.x = element_blank(), axis.ticks = element_blank(), panel.grid = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  scale_fill_manual(values = paleta_kolorow) +  # Ustawienie kolorów zdefiniowanych wcześniej
  geom_text(aes(label = LiczbaAnalitykow), position = position_stack(vjust = 0.5))

#Wyświetlenie wykresu
print(wykres_kolowy)



####WYKRES PUDEŁKOWY ŚREDNICH ZAROBKOW DLA KAŻDEGO STANOWISKA
wykres_pudełkowy <- ggplot(wynagrodzenia_AD, aes(x = Stanowisko, y = Wynagrodzenie_w_USD, fill = Stanowisko)) +
  geom_boxplot() +
  labs(title = "Wykres pudełkowy średnich zarobków dla każdego stanowiska", x = "Stanowisko", y = "Wynagrodzenie (USD)") +
  scale_y_continuous(labels = scales::comma) +  # Formatowanie osi y bez notacji wykładniczej
  scale_fill_viridis_d() +  # Ustawienie automatycznie generowanych kolorów
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1), 
        legend.position = "none")  # Usunięcie legendy

#Wyświetlenie wykresu
print(wykres_pudełkowy)



###WYKRES SŁUPKOWY ŚREDNICH ZAROBKÓW W KAŻDYM KRAJU
#Średnie wynagrodzenie dla każdego kraju
srednie_wynagrodzenie_kraju <- aggregate(Wynagrodzenie_w_USD ~ MiejsceFirmy, data = wynagrodzenia_AD, FUN = mean)

#Sortowanie według średniego wynagrodzenia malejąco
srednie_wynagrodzenie_kraju <- srednie_wynagrodzenie_kraju[order(-srednie_wynagrodzenie_kraju$Wynagrodzenie_w_USD), ]


#Paleta kolorów dla każdego kraju
kolor_kraju <- rainbow(length(unique(srednie_wynagrodzenie_kraju$MiejsceFirmy)))

#Wykres słupkowy ze średnim wynagrodzeniem dla każdego kraju
wykres_slupkowy <- ggplot(srednie_wynagrodzenie_kraju, aes(x = MiejsceFirmy, y = Wynagrodzenie_w_USD, fill = MiejsceFirmy)) +
  geom_bar(stat = "identity") +
  labs(title = "Średnie wynagrodzenie dla każdego kraju", x = "Kraj", y = "Średnie wynagrodzenie (USD)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 1),  # Pochylenie etykiet osi x
        plot.title = element_text(hjust = 0.5),  # Wyśrodkowanie tytułu
        legend.position = "none") +  # Usunięcie legendy
  scale_fill_manual(values = kolor_kraju) +  # Ustawienie różnych kolorów dla każdego kraju
  coord_flip()  # Obrócenie wykresu

#Wyświetlenie wykresu
print(wykres_slupkowy)



###WYKRES DYSTRYBUANTY
#Wygenerowanie wykresu dystrybuanty
wykres_dystrybuanty <- ggplot(wynagrodzenia_AD, aes(x = Wynagrodzenie_w_USD)) +
  stat_ecdf(geom = "step", pad = FALSE) +  # Dodanie wykresu dystrybuanty
  labs(title = "Wykres dystrybuanty wynagrodzeń", x = "Wynagrodzenie (USD)", y = "Dystrybuanta") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))  # Wyśrodkowanie tytułu

#Wyświetlenie wykresu
print(wykres_dystrybuanty)




###HISTOGRAM
#Wygenerowanie palety kolorów tęczy
n_colors <- 56 # Określenie liczby kolorów w palecie
rainbow_palette <- colorRampPalette(colors = rainbow(n_colors))

#Histogram rozkładu wynagrodzeń analityków danych dla wszystkich krajów naraz
wykres_histogram <- ggplot(wynagrodzenia_AD, aes(x = Wynagrodzenie_w_USD, fill = factor(..x..))) +
  geom_histogram(binwidth = 500, color = "black") +
  scale_fill_manual(values = rainbow_palette(n_colors)) +
  labs(title = "Histogram rozkładu wynagrodzeń analityków danych", x = "Wynagrodzenie (USD)", y = "Liczba analityków danych") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "none")  # Usunięcie legendy i wyśrodkowanie tytułu

#Wyświetlenie wykresu
print(wykres_histogram)



#Hipotezy
'H1: Istnieje statystycznie istotna różnica między średnimi wynagrodzeniami analityków danych w Polsce i USA.'
# Filtracja danych dla Polski i Stanów Zjednoczonych
dane_polska <- subset(wynagrodzenia_AD, MiejsceFirmy == "Polska")
dane_usa <- subset(wynagrodzenia_AD, MiejsceFirmy == "Stany Zjednoczone")

# Wyciągnięcie wynagrodzeń
wynagrodzenia_polska <- dane_polska$Wynagrodzenie_w_USD
wynagrodzenia_usa <- dane_usa$Wynagrodzenie_w_USD

# Test normalności Shapiro-Wilka
shapiro_polska <- shapiro.test(wynagrodzenia_polska)
shapiro_usa <- shapiro.test(wynagrodzenia_usa)

# Test równości wariancji Levene'a
install.packages("car")
library("car")
levene_test <- leveneTest(Wynagrodzenie_w_USD ~ MiejsceFirmy, data = wynagrodzenia_AD)

# Test t-studenta
test_t <- t.test(wynagrodzenia_polska, wynagrodzenia_usa, var.equal = TRUE)

# Alternatywnie, test t-studenta z korektą Welch'a
test_t_welch <- t.test(wynagrodzenia_polska, wynagrodzenia_usa, var.equal = FALSE)

# Wyniki testu t-studenta
print(test_t)
print(test_t_welch)




# H2: Istnieje statystycznie istotna różnica między średnimi wynagrodzeniami analityków danych w Polsce i Niemczech.
# Filtracja danych dla Polski i Niemiec
dane_polska <- subset(wynagrodzenia_AD, MiejsceFirmy == "Polska")
dane_niemcy <- subset(wynagrodzenia_AD, MiejsceFirmy == "Niemcy")

# Wyciągnięcie wynagrodzeń
wynagrodzenia_polska <- dane_polska$Wynagrodzenie_w_USD
wynagrodzenia_niemcy <- dane_niemcy$Wynagrodzenie_w_USD

# Test normalności Shapiro-Wilka
shapiro_polska <- shapiro.test(wynagrodzenia_polska)
shapiro_niemcy <- shapiro.test(wynagrodzenia_niemcy)

# Test równości wariancji Levene'a
library("car")
levene_test <- leveneTest(Wynagrodzenie_w_USD ~ MiejsceFirmy, data = wynagrodzenia_AD)

# Test t-studenta
test_t <- t.test(wynagrodzenia_polska, wynagrodzenia_niemcy, var.equal = TRUE)

# Alternatywnie, test t-studenta z korektą Welch'a
test_t_welch <- t.test(wynagrodzenia_polska, wynagrodzenia_niemcy, var.equal = FALSE)

# Wyniki testu t-studenta
print(test_t)
print(test_t_welch)






