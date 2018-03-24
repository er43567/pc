/*
 * 名称: 小歆记账APICloud JavaScript Library
 * 作者: Chishin
 * 网址: http://jz.xxgzs.org
 * 时间: 2016年9月3日
 */
(function(window){
    var u = {}

    /**
     * 时间戳转字符串格式 (时间戳为标准10位整数, 需在js时间戳/1000)
     */
    u.intTimeFormat = function(intTime, format) {
        intTime = parseInt(intTime);
        var d = new Date(intTime * 1000);
        var strDate = (d.getFullYear()) + "-" + (d.getMonth() + 1) + "-" + (d.getDate());
        return u.strDateFormat(strDate, format);
    }

    /**
     * 日期字符串格式
     */
    u.strDateFormat = function(strDate, format) {
        var obj = u.strDate(strDate);
        if (obj) {
            format = format.toLowerCase();
            if(/y/g.test(format)){
                format = format.replace(/y+/g, obj.year);
            }
            if (/mm/g.test(format)) {
                if (obj.month.length === 1) {
                    obj.month = '0' + obj.month;
                }
                format = format.replace(/mm/g, obj.month);
            } else if (/m/g.test(format)) {
                obj.month = '' + parseInt(obj.month);
                format = format.replace(/m+/g, obj.month);
            }
            if (/dd/g.test(format)) {
                if (obj.day.length === 1) {
                    obj.day = '0' + obj.day;
                }
                format = format.replace(/dd/g, obj.day);
            } else if (/d/g.test(format)) {
                obj.day = '' + parseInt(obj.day);
                format = format.replace(/d+/g, obj.day);
            }
            if (/w/g.test(format)) {
                var arrWeek = ['日', '一', '二', '三', '四', '五', '六', '日'];
                var week = new Date(obj.year+'/'+obj.month+'/'+obj.day).getDay();
                format = format.replace(/w+/g, arrWeek[week]);
            }
            return format;
        } else {
            return false;
        }
    }

    /**
     * 日期字符串分解
     * obj.year、obj.month、obj.day
     */
    u.strDate = function(strDate) {
        strDate = strDate.replace(/[\'\s]+/g, '');
        if (strDate) {
            var date = strDate.match(/\d+/g);
            if (date.length === 3) {
                var obj = {};
                obj.year = date[0];
                obj.month = date[1];
                obj.day = date[2];
                return obj;
            }
        }
        return false;
    }

    window.$app = u;
})(window);

