# Zarobki Analityków Danych 📊💼
## Projekt realizowany w ramach przedmiotu „Statystyczna Analiza Danych” 🎓

### Opis projektu 📝
Projekt koncentruje się na analizie wynagrodzeń w branży analityki danych, wykorzystując dane pozyskane z platformy Kaggle. Analiza została przeprowadzona przy użyciu języka R w środowisku RStudio. Projekt obejmuje szeroki zakres działań analitycznych, od wstępnego przetwarzania danych po zaawansowane metody statystyczne.

### Źródło danych 📂
Dane użyte w projekcie pochodzą z bazy danych dostępnej na platformie Kaggle: [Data Science Salaries](https://www.kaggle.com/datasets/zain280/data-science-salaries/data). Zbiór danych zawiera informacje o wynagrodzeniach w dziedzinie analizy danych, w różnych lokalizacjach, na różnych poziomach doświadczenia oraz na różnych stanowiskach.

### Struktura danych 📊
Zestaw danych składa się z 11 kolumn i 607 wierszy, z każdą obserwacją reprezentującą wynagrodzenie jednego pracownika. Dane obejmują m.in.:
- Rok pracy 📅
- Poziom doświadczenia 👩‍💻👨‍💻
- Rodzaj zatrudnienia 🧑‍💼
- Stanowisko 🏢
- Wynagrodzenie (w różnych walutach) 💵
- Lokalizację pracownika i firmy 🌍
- Wielkość firmy 🏢

### Proces analizy danych 🔍
1. **Wstępne przetwarzanie danych**:
   - Wczytanie danych z pliku CSV. 📥
   - Usunięcie niepotrzebnych kolumn. 🚮
   - Tłumaczenie nazw krajów, stanowisk, poziomów doświadczenia oraz rodzajów zatrudnienia na język polski. 🇵🇱
   - Usunięcie wartości odstających. 🔧
   - Ujednolicenie wartości wynagrodzeń do miesięcznych. 💵

2. **Wyznaczenie parametrów opisowych**:
   - Obliczenie średniej, mediany, dominanty, odchylenia standardowego, rozstępu, wariancji oraz kwartyl. 📊
   - Analiza współczynnika zmienności, współczynnika i wskaźnika asymetrii. 📈

3. **Graficzna prezentacja danych**:
   - Wykresy kołowe, pudełkowe, słupkowe, dystrybuanty oraz histogramy. 🔬

4. **Testowanie hipotez statystycznych**:
   - Testowanie hipotez dotyczących różnic w wynagrodzeniach w zależności od poziomu doświadczenia, lokalizacji oraz innych zmiennych.

### Wyniki i wnioski 🧠
Wyniki analizy dostarczają cennych informacji na temat struktury wynagrodzeń w branży analityki danych. Analiza pozwala zrozumieć trendy rynkowe, czynniki wpływające na wynagrodzenia oraz regionalne różnice w płacach. 🌍💸.

### Użyte narzędzia i biblioteki 🛠️
* R 📜
* RStudio 🖥️
* Pakiety R:
   * ggplot2 🎨
   * dplyr 🔄
   * tidyr 🧹
   * readr 📑
   * lubridate ⏰
   * i inne...

