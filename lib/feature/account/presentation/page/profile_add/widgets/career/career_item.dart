part of 'profile_add_career.dart';

class _CareerItem extends StatelessWidget {
  final CareerEntity entity;

  final VoidCallback onTap;

  const _CareerItem({required this.entity, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final String name = entity.name.isValid() ? entity.name.value : '경력 이름';

    final String content =
        entity.content.isValid() ? entity.content.value : '경력 내용을 입력해주세요.';

    final String period =
        entity.startDate.isValid() ? entity.period : 'YYYY/MM/DD-YYYY/MM/DD';

    final String company =
        entity.companyName.isValid() ? entity.companyName.value : '회사명.';

    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,

      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: getTextColor(entity.name.isValid()),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    context.read<ProfileAddBloc>().add(
                      ProfileAddCareerDeleted(entity: entity),
                    );
                  },
                  child: Assets.images.close.svg(),
                ),
              ],
            ),
            Text(
              content,
              style: context.textTheme.bodySmall?.copyWith(
                color: getTextColor(entity.name.isValid()),
              ),
            ),
            Row(
              children: [
                Text(
                  period,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: getSecondaryTextColor(entity.name.isValid()),
                  ),
                ),
                Spacer(),
                Text(
                  company,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: getSecondaryTextColor(entity.name.isValid()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color getTextColor(bool hasText) {
    return hasText ? ColorName.text : Colors.grey;
  }

  Color getSecondaryTextColor(bool hasText) {
    return hasText ? ColorName.secondary : Colors.grey;
  }
}
