import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/injection/injection_container.dart';
import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/presentation/pages/widgets/gradient_button.dart';
import '../../../../core/services/navigation_service.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../bloc/add_publication_cubit/add_publication_cubit.dart';

class Calendar extends StatelessWidget {
  final AddPublicationState state;
  const Calendar({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 21, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => sl<NavigatorService>().pop(),
                    child: context.read<AppThemeCubit>().state.appIcons.closeIcon),
                AppText(
                  'Select dates',
                  style: context.read<AppThemeCubit>().state.textTheme.calendarTitleTextStyle,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<AddPublicationCubit>().resetAllDays();
                  },
                  child: AppText(
                    'Clear',
                    style: context.read<AppThemeCubit>().state.textTheme.calendarClearButtonTextStyle,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 21),
          Divider(
            color: AppColorScheme.remi,
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 34, 16),
            child: TableCalendar(
              calendarStyle: CalendarStyle(
                rangeHighlightColor: AppColorScheme.remi,
              ),
              firstDay: DateTime.utc(1970, 12, 31),
              lastDay: DateTime.utc(
                DateTime.now().year + 1,
                DateTime.now().month,
                DateTime.daysPerWeek,
              ),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (day) => isSameDay(state.selectedDay, day),
              rangeStartDay: state.rangeStartDay,
              rangeEndDay: state.rangeEndDay,
              calendarFormat: CalendarFormat.month,
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(state.selectedDay, selectedDay)) {
                  context.read<AddPublicationCubit>().resetStartEndDays();
                  context.read<AddPublicationCubit>().onDaySelected(selectedDay, focusedDay);
                  context.read<AddPublicationCubit>().calendarModeToggle(RangeSelectionMode.toggledOff);
                }
              },
              onRangeSelected: (start, end, focusedDay) {
                context.read<AddPublicationCubit>().resetSelectedDay();
                context.read<AddPublicationCubit>().onRangeSelected(start, end, focusedDay);
                if (start != null && end != null) {
                  context.read<AddPublicationCubit>().updateDate(start, end);
                }

                context.read<AddPublicationCubit>().calendarModeToggle(RangeSelectionMode.toggledOn);
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextFormatter: (date, _) => DateFormat.MMMd().format(date),
              ),
              rangeSelectionMode: state.rangeSelectionMode,
              calendarBuilders: CalendarBuilders(dowBuilder: (context, day) {
                return Center(
                  child: AppText(
                    DateFormat.E().format(day),
                    style: context.read<AppThemeCubit>().state.textTheme.calendarWeekDaysTextStyle,
                  ),
                );
              }, todayBuilder: (context, day, _) {
                return Center(
                  child: CircleAvatar(
                    backgroundColor: AppColorScheme.hollywoodCerise,
                    child: AppText(
                      DateFormat.d().format(day),
                      color: AppColorScheme.white,
                    ),
                  ),
                );
              }, rangeStartBuilder: (context, day, _) {
                return Center(
                  child: CircleAvatar(
                    backgroundColor: AppColorScheme.hollywoodCerise,
                    child: AppText(
                      DateFormat.d().format(day),
                      style: context.read<AppThemeCubit>().state.textTheme.calendarSelectedDayTextStyle,
                    ),
                  ),
                );
              }, rangeEndBuilder: (context, day, _) {
                return Center(
                  child: CircleAvatar(
                    backgroundColor: AppColorScheme.hollywoodCerise,
                    child: AppText(
                      DateFormat.d().format(day),
                      style: context.read<AppThemeCubit>().state.textTheme.calendarSelectedDayTextStyle,
                    ),
                  ),
                );
              }, headerTitleBuilder: (context, date) {
                return Center(
                  child: AppText(
                    (state.rangeStartDay != null && state.rangeEndDay != null)
                        ? DateFormat.MMMd().format(state.rangeStartDay!) +
                            ' - ' +
                            DateFormat.MMMd().format(state.rangeEndDay!)
                        : DateFormat.MMMd().format(date),
                    style: context.read<AppThemeCubit>().state.textTheme.calendarHeaderTextStyle,
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12, right: 20),
            child: GradientButton(
              onTap: () => sl<NavigatorService>().pop(),
              text: 'Save',
              isWide: false,
            ),
          ),
        ],
      ),
    );
  }
}
