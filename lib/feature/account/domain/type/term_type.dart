enum TermType {
  /// 서비스 이용 약관
  service(
    isRequired: true,
    url: 'https://www.notion.so/1a441ccd5a62805bb0f9d37556cdbb33?pvs=4',
  ),

  /// 개인정보 수집 동의
  privacy(
    isRequired: true,
    url: 'https://www.notion.so/1a441ccd5a628076a690f9d7e3a63583?pvs=4',
  ),

  /// 전자금융거래
  finance(
    isRequired: false,
    url: 'https://www.notion.so/1a441ccd5a6280bbac63c686d5d89cd9?pvs=4',
  ),

  /// 위치동의
  location(
    isRequired: false,
    url: 'https://www.notion.so/1a441ccd5a62800f9c4bd4d455451490?pvs=4',
  ),

  /// 마케팅
  marketing(
    isRequired: false,
    url: 'https://www.notion.so/1a441ccd5a62802790cdc09696dbc6bb?pvs=4',
  );

  final bool isRequired;

  final String url;

  const TermType({required this.isRequired, required this.url});

  @override
  String toString() {
    switch (this) {
      case TermType.service:
        return '[ 필수 ] 서비스 이용약관';
      case TermType.privacy:
        return '[ 필수 ] 개인정보 수집 및 이용 동의';
      case TermType.finance:
        return '[ 선택 ] 전자금융거래 이용약관';
      case TermType.location:
        return '[ 선택 ] 위치정보 이용약관';
      case TermType.marketing:
        return '[ 선택 ] 마케팅 정보 수신 동의';
    }
  }
}
