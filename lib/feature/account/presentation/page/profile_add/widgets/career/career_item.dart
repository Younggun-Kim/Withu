part of 'profile_add_career.dart';

class _CareerItem extends StatelessWidget {
  final CareerEntity entity;

  const _CareerItem({required this.entity});

  @override
  Widget build(BuildContext context) {
    final String name =
        entity.name.value.isNotEmpty ? entity.name.value : '경력 이름';

    final String content =
        entity.content.isValid() ? entity.content.value : '경력 내용을 입력해주세요.';

    final String period =
        entity.startDate.isValid() ? entity.period : 'YYYY/MM/DD-YYYY/MM/DD';

    final String company =
        entity.companyName.isValid() ? entity.companyName.value : '회사명';

    return ProfileAddBlocBuilder(
      builder: (context, state) {
        return Padding(
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
                        color: getTextColor(entity.name.value.isNotEmpty),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  BaseButton.fit(
                    context: context,
                    text: StringRes.update.tr,
                    onTap: () {
                      CareerFormBottomSheet.show(
                        context: context,
                        career: entity,
                        onUpdate: (CareerEntity newEntity) {
                          context.read<ProfileAddBloc>().add(
                            ProfileAddCareerUpdated(entity: newEntity),
                          );
                        },
                        onDeleted: () {
                          context.read<ProfileAddBloc>().add(
                            ProfileAddCareerDeleted(entity: entity),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              Text(
                content,
                style: context.textTheme.bodySmall?.copyWith(
                  color: getTextColor(entity.content.isValid()),
                ),
              ),
              Row(
                children: [
                  Text(
                    period,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: getSecondaryTextColor(entity.startDate.isValid()),
                    ),
                  ),
                  Spacer(),
                  Text(
                    company,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: getSecondaryTextColor(
                        entity.companyName.isValid(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Color getTextColor(bool hasText) {
    return hasText ? ColorName.text : Colors.grey;
  }

  Color getSecondaryTextColor(bool hasText) {
    return hasText ? ColorName.secondary : Colors.grey;
  }
}
