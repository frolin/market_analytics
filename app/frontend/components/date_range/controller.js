import {Controller} from "@hotwired/stimulus"
import moment from 'moment';

import daterangepicker from 'daterangepicker'
window.daterangepicker = daterangepicker

export default class extends Controller {
    static targets = ["date_range"]

    connect() {
        if (this.date_rangeTarget) {
            let selectedRange = false
            $(this.date_rangeTarget).daterangepicker({
                showCustomRangeLabel: false,
                alwaysShowCalendars: true,
                autoApply: true,
                ranges: {
                    'Сегодня': [moment(), moment()],
                    'Вчера': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    '7 дней': [moment().subtract(6, 'days'), moment()],
                    '30 дней': [moment().subtract(29, 'days'), moment()],
                    'Этот месяц': [moment().startOf('month'), moment().endOf('month')],
                    'Последний месяц': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                }
            }).on('apply.daterangepicker', function (e, picker) {
                if (selectedRange) {
                    picker.show();
                    selectedRange = false;
                }
                $('#date-submit').click();
            });
            // $(".ranges ul li").on("click", function () {
            //     // selectedRange = $(this).text();
            //     if (selectedRange) {
            //         picker.show();
            //         selectedRange = false;
            //     }
            //     $('#date-submit').click();
            // });
        }
    }

    initialize() {
    }

    rangeSelected(e, picker) {
    }

    submit(e) {
        console.log("click")
        this.element.submit()
    }


}