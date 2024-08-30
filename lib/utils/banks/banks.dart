const banks = [
  "CRDB BANK PLC",
  "PEOPLE’S BANK OF ZANZIBAR LTD",
  "STANDARD CHARTERED BANK (T) LIMITED",
  "STANBIC BANK TANZANIA LTD.",
  "CITIBANK TANZANIA LTD",
  "BANK OF AFRICA TANZANIA LIMITED",
  "DIAMOND TRUST BANK TANZANIA LTD",
  "AKIBA COMMERCIAL BANK LTD",
  "EXIM BANK (TANZANIA) LTD",
  "KILIMANJARO CO-OPERATIVE BANK LTD",
  "NATIONAL BANK OF COMMERCE LTD",
  "NATIONAL MICROFINANCE BANK LIMITED",
  "KCB BANK TANZANIA LIMITED",
  "HABIB AFRICAN BANK LIMITED",
  "INTERNATIONAL COMMERCIAL BANK (TANZANIA) LIMITED",
  "ABSA BANK TANZANIA LTD",
  "I  M BANK LIMITED",
  "NCBA BANK LIMITED",
  "DAR ES SALAAM COMMUNITY BANK LTD",
  "BANK OF BARODA (TANZANIA) LTD",
  "AZANIA BANK LIMITED",
  "UCHUMI COMMERCIAL BANK  (T) LTD",
  "AFRICAN BANKING CORPORATION TANZANIA LIMITED",
  "ACCESSBANK TANZANIA LTD",
  "BANK OF INDIA (TANZANIA) LIMITED",
  "UNITED BANK FOR AFRICA (T) LTD",
  "MKOMBOZI COMMERCIAL BANK",
  "ECOBANK TANZANIA LIMITED",
  "MWANGA HAKIKA MICROFINANCE BANK LIMITED",
  "FIRST NATIONAL BANK LIMITED",
  "AMANA BANK LIMITED",
  "EQUITY BANK TANZANIA LIMITED",
  "TANZANIA COMMERCIAL BANK PLC",
  "MAENDELEO BANK LTD",
  "CANARA BANK TANZANIA LTD",
  "MWALIMU COMMERCIAL BANK PLC",
  "GUARANTY TRUST BANK (T) LTD",
  "YETU MICROFINANCE BANK PLC",
  "CHINA DASHENG BANK LIMITED",
];

const shortNames = [
  "CRDB",
  "PBZ",
  "SCB",
  "STANBIC",
  "CITI",
  "BOA",
  "DTB",
  "AKIBA",
  "EXIM",
  "KILIMANJARO",
  "NBC",
  "NMB",
  "KCB",
  "HABIB",
  "ICB",
  "ABSA",
  "IMBANK",
  "NCBA",
  "DCB",
  "BARODA",
  "AZANIA",
  "UCHUMI",
  "BANCABC",
  "ACCESS",
  "BOI",
  "UBA",
  "MKOMBOZI",
  "ECOBANK",
  "MWANGA",
  "FNB",
  "AMANA",
  "EQUITY",
  "TCB",
  "MAENDELEO",
  "CANARA",
  "MWALIMU",
  "GT BANK",
  "YETU",
  "DASHENG",
];

const swiftCodes = [
  "CORUTZTZ",
  "PBZATZTZ",
  "SCBLTZTX",
  "SBICTZTX",
  "CITITZTZ",
  "EUAFTZTZ",
  "DTKETZTZ",
  "AKCOTZTZ",
  "EXTNTZTZ",
  "KLMJTZTZ",
  "NLCBTZTX",
  "NMIBTZTZ",
  "KCBLTZTZ",
  "HABLTZTZ",
  "BKMYTZTZ",
  "BARCTZTZ",
  "IMBLTZTZ",
  "CBAFTZTZ",
  "DASUTZTZ",
  "BARBTZTZ",
  "AZANTZTZ",
  "UCCTTZTZ",
  "FMBZTZTX",
  "ACTZTZTZ",
  "BKIDTZTZ",
  "UNAFTZTZ",
  "MKCBTZTZ",
  "ECOCTZTZ",
  "MWCBTZTZ",
  "FIRNTZTX",
  "AMNNTZTZ",
  "EQBLTZTZ",
  "TAPBTZTZ",
  "MBTLTZTZ",
  "CNRBTZTZ",
  "MWCOTZTZ",
  "GTBITZTZ",
  "YETMTZTZ",
  "CDSHTZTZ",
];

enum Bank {
  crdb("CRDB", "CRDB BANK PLC", "CORUTZTZ"),
  pbz("PBZ", "PEOPLE’S BANK OF ZANZIBAR LTD", "PBZATZTZ"),
  scb("SCB", "STANDARD CHARTERED BANK (T) LIMITED", "SCBLTZTX"),
  stanbic("STANBIC", "STANBIC BANK TANZANIA LTD.", "SBICTZTX"),
  citi("CITI", "CITIBANK TANZANIA LTD", "CITITZTZ"),
  boa("BOA", "BANK OF AFRICA TANZANIA LIMITED", "EUAFTZTZ"),
  dtb("DTB", "DIAMOND TRUST BANK TANZANIA LTD", "DTKETZTZ"),
  akiba("AKIBA", "AKIBA COMMERCIAL BANK LTD", "AKCOTZTZ"),
  exim("EXIM", "EXIM BANK (TANZANIA) LTD", "EXTNTZTZ"),
  kilimanjaro("KILIMANJARO", "KILIMANJARO CO-OPERATIVE BANK LTD", "KLMJTZTZ"),
  nbc("NBC", "NATIONAL BANK OF COMMERCE LTD", "NLCBTZTX"),
  nmb("NMB", "NATIONAL MICROFINANCE BANK LIMITED", "NMIBTZTZ"),
  kcb("KCB", "KCB BANK TANZANIA LIMITED", "KCBLTZTZ"),
  habib("HABIB", "HABIB AFRICAN BANK LIMITED", "HABLTZTZ"),
  icb("ICB", "INTERNATIONAL COMMERCIAL BANK (TANZANIA) LIMITED","BKMYTZTZ"),
  absa("ABSA", "ABSA BANK TANZANIA LTD", "BARCTZTZ"),
  imbank("IMBANK", "I  M BANK LIMITED", "IMBLTZTZ"),
  ncba("NCBA", "NATIONAL BANK OF COMMERCE LTD", "CBAFTZTZ"),
  dcb("DCB", "DAR ES SALAAM COMMUNITY BANK LTD", "DASUTZTZ"),
  baroda("BARODA", "BANK OF BARODA (TANZANIA) LTD", "BARBTZTZ"),
  azania("AZANIA", "AZANIA BANK LIMITED", "AZANTZTZ"),
  uchumi("UCHUMI", "UCHUMI COMMERCIAL BANK (T) LTD","UCCTTZTZ"),
  bancabc("BANCABC", "AFRICAN BANKING CORPORATION TANZANIA LIMITED", "FMBZTZTX"),
  access("ACCESS", "ACCESSBANK TANZANIA LTD", "ACTZTZTZ"),
  boi("BOI", "UNITED BANK FOR AFRICA (T) LTD", "BKIDTZTZ"),
  uba("UBA", "UNITED BANK FOR AFRICA (T) LTD", "UNAFTZTZ"),
  mkombozi("MKOMBOZI", "MKOMBOZI COMMERCIAL BANK", "MKCBTZTZ"),
  ecobank("ECOBANK", "ECOBANK TANZANIA LIMITED", "ECOCTZTZ"),
  mwanga("MWANGA", "MWANGA HAKIKA MICROFINANCE BANK LIMITED", "MWCBTZTZ"),
  fnb("FNB", "FIRST NATIONAL BANK LIMITED", "FIRNTZTX"),
  amana("AMANA", "AMANA BANK LIMITED", "AMNNTZTZ"),
  equity("EQUITY", "EQUITY BANK TANZANIA LIMITED", "EQBLTZTZ"),
  tcb("TCB", "TANZANIA COMMERCIAL BANK PLC", "TAPBTZTZ"),
  maendeleo("MAENDELEO", "MAENDELEO BANK LTD", "MBTLTZTZ"),
  canara("CANARA", "CANARA BANK TANZANIA LTD", "CNRBTZTZ"),
  mwalimu("MWALIMU", "MWALIMU COMMERCIAL BANK PLC", "MWCOTZTZ"),
  gtBank("GTBANK", "GUARANTY TRUST BANK (T) LTD", "GTBITZTZ"),
  yetu("YETU", "YETU MICROFINANCE BANK PLC", "YETMTZTZ"),
  dasheng("DASHENG", "CHINA DASHENG BANK LIMITED", "CDSHTZTZ"),
  ;

  final String shortName;
  final String fullName;
  final String swiftCode;

  const Bank(this.shortName, this.fullName, this.swiftCode);
}
