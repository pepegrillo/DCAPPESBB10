/*
 * ActiveFrameQML.hpp
 *
 *  Created on: 31/07/2013
 *      Author: JosueLopez
 */

#ifndef ACTIVEFRAMEQML_H_
#define ACTIVEFRAMEQML_H_

#include <QObject>
#include <bb/cascades/Label>
#include <bb/cascades/SceneCover>

using namespace ::bb::cascades;

class ActiveFrameQML: public SceneCover {
    Q_OBJECT

public:
    ActiveFrameQML(QObject *parent=0);

public slots:
    Q_INVOKABLE void update(QString appText);

private:
    bb::cascades::Label *m_coverLabel;
};

#endif /* ACTIVEFRAMEQML_H_ */
