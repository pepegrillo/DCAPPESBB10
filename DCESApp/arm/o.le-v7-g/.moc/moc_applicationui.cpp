/****************************************************************************
** Meta object code from reading C++ file 'applicationui.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/applicationui.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'applicationui.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ApplicationUI[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      10,   14, // methods
       7,   64, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: signature, parameters, type, tag, flags
      15,   14,   14,   14, 0x05,
      30,   14,   14,   14, 0x05,
      46,   14,   14,   14, 0x05,

 // slots: signature, parameters, type, tag, flags
      62,   14,   14,   14, 0x0a,
      95,   83,   14,   14, 0x0a,
     120,   83,   14,   14, 0x0a,
     202,  146,   14,   14, 0x0a,
     257,   14,   14,   14, 0x0a,
     283,  265,   14,   14, 0x08,

 // methods: signature, parameters, type, tag, flags
     343,  334,  323,   14, 0x02,

 // properties: name, type, flags
     371,  366, 0x01495001,
     378,  366, 0x01495001,
     392,  384, 0x0a495001,
     430,  405, 0x00095409,
     436,  405, 0x00095409,
     450,  405, 0x00095409,
     465,  405, 0x00095409,

 // properties: notify_signal_id
       1,
       2,
       2,
       0,
       0,
       0,
       0,

       0        // eod
};

static const char qt_meta_stringdata_ApplicationUI[] = {
    "ApplicationUI\0\0tweetsLoaded()\0"
    "activeChanged()\0statusChanged()\0"
    "requestCatProducto()\0idCategoria\0"
    "requestProducto(QString)\0"
    "requestMunicipio(QString)\0"
    "idMunicipio,idProducto,idEstablecimiento,idPresentacion\0"
    "requestProductoFiltro(QString,QString,QString,QString)\0"
    "reset()\0info,success,tipo\0"
    "onTwitterTimeline(QString,bool,QString)\0"
    "QByteArray\0toEncode\0encodeQString(QString)\0"
    "bool\0active\0error\0QString\0errorMessage\0"
    "bb::cascades::DataModel*\0model\0"
    "modelProducto\0modelMunicipio\0"
    "modelProductoFiltro\0"
};

void ApplicationUI::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ApplicationUI *_t = static_cast<ApplicationUI *>(_o);
        switch (_id) {
        case 0: _t->tweetsLoaded(); break;
        case 1: _t->activeChanged(); break;
        case 2: _t->statusChanged(); break;
        case 3: _t->requestCatProducto(); break;
        case 4: _t->requestProducto((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 5: _t->requestMunicipio((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 6: _t->requestProductoFiltro((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const QString(*)>(_a[4]))); break;
        case 7: _t->reset(); break;
        case 8: _t->onTwitterTimeline((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3]))); break;
        case 9: { QByteArray _r = _t->encodeQString((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QByteArray*>(_a[0]) = _r; }  break;
        default: ;
        }
    }
}

const QMetaObjectExtraData ApplicationUI::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ApplicationUI::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ApplicationUI,
      qt_meta_data_ApplicationUI, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ApplicationUI::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ApplicationUI::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ApplicationUI::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ApplicationUI))
        return static_cast<void*>(const_cast< ApplicationUI*>(this));
    return QObject::qt_metacast(_clname);
}

int ApplicationUI::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 10)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bool*>(_v) = active(); break;
        case 1: *reinterpret_cast< bool*>(_v) = error(); break;
        case 2: *reinterpret_cast< QString*>(_v) = errorMessage(); break;
        case 3: *reinterpret_cast< bb::cascades::DataModel**>(_v) = model(); break;
        case 4: *reinterpret_cast< bb::cascades::DataModel**>(_v) = modelProducto(); break;
        case 5: *reinterpret_cast< bb::cascades::DataModel**>(_v) = modelMunicipio(); break;
        case 6: *reinterpret_cast< bb::cascades::DataModel**>(_v) = modelProductoFiltro(); break;
        }
        _id -= 7;
    } else if (_c == QMetaObject::WriteProperty) {
        _id -= 7;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 7;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void ApplicationUI::tweetsLoaded()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void ApplicationUI::activeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void ApplicationUI::statusChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}
QT_END_MOC_NAMESPACE
