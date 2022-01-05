class BaoChiMangXaHoiBloc {

  String titleAppbar = 'Báo cáo thống kê';

  void getTextAppbar(int select) {
    switch(select) {
      case 0 : {
        titleAppbar = 'Báo cáo thống kê';
        break;
      }

      case 1 : {
        titleAppbar = 'Tất cả chủ đề';
        break;
      }

      case 2 : {
        titleAppbar = 'Theo dõi bài viết';
        break;
      }

      case 3 : {
        titleAppbar = 'Tin tức thời sự';
        break;
      }

      default : {
        titleAppbar = 'Báo cáo thống kê';
        break;
      }
    }
  }
}
