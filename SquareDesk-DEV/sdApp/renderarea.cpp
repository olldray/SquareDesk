#include "renderarea.h"

#include <QPainter>
#include <QDebug>

RenderArea::RenderArea(QWidget *parent)
    : QWidget(parent)
{
    setBackgroundRole(QPalette::Base);
    setAutoFillBackground(true);
    bad = 0;
}

QSize RenderArea::minimumSizeHint() const
{
    return QSize(360, 360);
}

QSize RenderArea::sizeHint() const
{
    return QSize(360, 360);
}

void RenderArea::setPen(const QPen &pen)
{
//    qDebug() << "setPen" << bad++;
    this->pen = pen;
//    update();
}

void RenderArea::setBrush(const QBrush &brush)
{
//    qDebug() << "setBrush" << bad++;
    this->brush = brush;
//    update();
}

void RenderArea::setLayout1(QString s)
{
//    qDebug() << "setLayout1" << bad++;
    this->layout1 = s;
    update();
}

void RenderArea::setLayout2(QStringList sl)
{
//    qDebug() << "setLayout2" << bad++;
    this->layout2 = sl;
    update();
}

void RenderArea::setFormation(QString s)
{
//    qDebug() << "setFormation" << bad++;
    this->formation = s;
    update();
}



void RenderArea::paintEvent(QPaintEvent * /* event */)
{
//    qDebug() << "paintEvent" << bad++;

    QRect rect(10, 20, 80, 60);

    QPainter painter(this);

    painter.setPen(QPen(Qt::black));
    painter.setRenderHint(QPainter::Antialiasing, true);

    if (layout1 != "" && layout2.length() != 0) {
//        qDebug() << "************";
//        qDebug() << "layouts:" << layout1 << layout2;
//        qDebug() << "w/h:" << this->width() << this->height();

        QPoint center(180,180);
//        qDebug() << "center:" << center;

        // make a list of each person
        QString peopleStr;
        foreach (const QString &line, layout2) {
            peopleStr += line;
        }
//        peopleStr.replace("    "," ").replace("   "," ").replace("  "," ").replace(QRegExp("^ "),"");
        peopleStr.replace(QRegExp("[ ]+")," ").replace(QRegExp("^ "),"");
//        qDebug() << "peopleStr:" << peopleStr;
        QStringList people = peopleStr.split(" ");
//        qDebug() << "people:" << people;

        if (people.length() < 8) {
            return; // defensive programming (with phantoms, get more than 8)
        }

        // scan for X and Y size -------------
        float x = 0.0;
        float y = 0.0;

        // THESE DEFINE THE SIZES OF PEOPLE AND THE ENTIRE FIELD
        int oneUnit = 5;                 // pixels: field is 4 * 12 of these wide and tall
        int oneSpace = 6 * oneUnit;      // pixels
        // note that one person is only 4 units wide

        x = y = 0.0;
        float longestx = 0.0;

        for (int i=0; i<layout1.length(); i++) {
            QChar c = layout1[i];
            QChar c2 = layout1[i+1];  // FIX: this goes off the end!
            if (c == '@' && c2 == '7') {
                if (x > longestx) {
                    longestx = x;
                }
                x = 0;
                y += 0.5*oneSpace;
                i++;  // consume the '7'
            } else if (c == '@' && c2 != '@') {
                if (x > longestx) {
                    longestx = x;
                }
                x = 0;
                y += oneSpace;
            } else if (c == '@' && c2 == '@') {
                if (x > longestx) {
                    longestx = x;
                }
                x = 0;
                y += oneSpace;
                i++;  // consume the second '@' for graphical plot
            } else if (c >= 'a' && c <= 'z') {
                x += 4.0*oneUnit;  // TEST
            } else if (c == ' ') {
                x += 1.0*oneUnit;
            } else if (c == '6') {
                x += 4.0*oneUnit;
            } else if (c == '8' || c == '5') {
                // for graphics, 5 and 8 are the same (1/2 person size)
                x += 2.0*oneUnit;
            } else if (c == '9') {
                x += 3.0*oneUnit;
            }
        }
        // tidal waves or 2FL will hit this because there are no @'s
        if (x > longestx) {
            longestx = x;
        }

        float xSize = longestx;        // total width is always accurate
        float ySize = y + 4.0*oneUnit; // total height is always one person short
//        qDebug() << "final x/y sizes (pixels):" << xSize << ySize;

        int xoffset = 180 - xSize/2.0;
        int yoffset = 180 - ySize/2.0;
//        qDebug() << "final x/y offsets (pixels):" << xoffset << yoffset;

        // draw the renderArea ---------------------
        QRect r2(0, 0, 360, 360);
        painter.setPen(QPen(Qt::black));
        painter.setBrush(QBrush(QColor(240,240,240)));
        painter.drawRect(r2);

        // draw the grid ---------------------
        for (int i=0; i<360; i+=oneSpace) {
            if (i == 180) {
                continue;  // skip the center lines
            }
            painter.setPen(QPen(Qt::black,0.25,Qt::DotLine));
            painter.drawLine(0,i,360,i);
            painter.drawLine(i,0,i,360);
        }

        // draw the center lines explictly
        painter.setPen(QPen(Qt::black,0.75,Qt::SolidLine));
        painter.drawLine(0,180,360,180);
        painter.drawLine(180,0,180,360);

        // draw the people ----------------------

        int person = 0;
        x = y = 0.0;

        for (int i=0; i<layout1.length(); i++) {
            QChar c = layout1[i];
            QChar c2 = layout1[i+1];
            if (c == '@' && c2 == '7') {
                x = 0;
                y += 0.5*oneSpace;
                i++;  // consume the '7'
            } else if (c == '@' && c2 != '@') {
                x = 0;
                y += oneSpace;
            } else if (c == '@' && c2 == '@') {
                x = 0;
                y += oneSpace;
                i++;  // consume the second '@' for graphical plot
            } else if (c >= 'a' && c <= 'z') {
                QString personString = people[person];
//                qDebug() << "personString:" << personString;

                if (personString.length() < 3) {
                    if (personString == ".") {
                        // phantoms
                        QRect phantom(x + xoffset + 1.5*oneUnit, y + yoffset + 1.5*oneUnit,
                                oneUnit, oneUnit);  // EACH PHANTOM TAKES UP SPACE MUCH SMALLER THAN REGULAR PERSON
                        painter.setBrush(QBrush(Qt::yellow));
                        painter.drawEllipse(phantom);
                        person++;
                        x += 4.0*oneUnit;  // TEST
                        continue;  //
                    } else {
                        break;  // defensive programming
                    }
                }
                QString personNumber = personString.at(0);
                QString personGender = personString.at(1);
                QString personDirection = personString.at(2);

                QRect r(x + xoffset, y + yoffset,
                        4*oneUnit, 4*oneUnit);  // EACH PERSON TAKES UP SPACE SMALLER THAN ONESPACE

                if (personNumber=="1") {
                    painter.setBrush(QBrush(COUPLE1COLOR));
                } else if (personNumber=="2") {
                    painter.setBrush(QBrush(COUPLE2COLOR));
                } else if (personNumber=="3") {
                    painter.setBrush(QBrush(COUPLE3COLOR));
                } else {
                    painter.setBrush(QBrush(COUPLE4COLOR));
                }

                if (personGender == "B") {
                    painter.drawRect(r);
                } else {
                    painter.drawEllipse(r);
                }

                QPoint personCenter(x + 2*oneUnit + xoffset,
                                    y + 2*oneUnit + yoffset);
                if (personDirection == "<") {
                    painter.drawLine(personCenter, personCenter + QPoint(-2*oneUnit,0));
                } else if (personDirection == ">") {
                    painter.drawLine(personCenter, personCenter + QPoint(2*oneUnit,0));
                } else if (personDirection == "V") {
                    painter.drawLine(personCenter, personCenter + QPoint(0,2*oneUnit));
                } else {
                    painter.drawLine(personCenter, personCenter + QPoint(0,-2*oneUnit));
                }

                person++;
                x += 4.0*oneUnit;  // TEST
            } else if (c == ' ') {
                x += 1.0*oneUnit;
            } else if (c == '6') {
                x += 4.0*oneUnit;
            } else if (c == '8' || c == '5') {
                // for graphics, 5 and 8 are the same (1/2 person size)
                x += 2.0*oneUnit;
            } else if (c == '9') {
                x += 3.0*oneUnit;
            }
        }

        // draw the formation (if there is one)
        if (formation != "") {
            painter.setFont(QFont("Arial",24,QFont::Bold));
            painter.drawText(190,30,formation);
        }
    }
}

// TODO: search messes us up, because it shows the final formation, which gets drawn. :-(
// TODO: Show a static square to start, before heads start.  (just initialize the layout strings properly!)

