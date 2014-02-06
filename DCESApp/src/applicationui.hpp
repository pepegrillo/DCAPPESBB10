/* Copyright (c) 2012 Research In Motion Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef ApplicationUI_HPP
#define ApplicationUI_HPP

#include <bb/cascades/GroupDataModel>
#include <bb/system/InvokeManager>
#include <QtCore/QObject>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/Application>
#include <bb/cascades/DropDown>

#include <bb/device/HardwareInfo>

#include <bb/cascades/Label>

#include <bb/cascades/CustomControl>

using namespace bb::cascades;

namespace bb {
namespace system {
class InvokeManager;
}
namespace cascades
    {
        class Container;
        class ListView;
        class NavigationPane;
        class Page;
    }
}

//! [0]
class ApplicationUI: public QObject {
Q_OBJECT

Q_PROPERTY(bool active READ active NOTIFY activeChanged)
Q_PROPERTY(bool error READ error NOTIFY statusChanged)
Q_PROPERTY(QString errorMessage READ errorMessage NOTIFY statusChanged)

Q_PROPERTY(bb::cascades::DataModel* model READ model CONSTANT)
Q_PROPERTY(bb::cascades::DataModel* modelProducto READ modelProducto CONSTANT)
Q_PROPERTY(bb::cascades::DataModel* modelMunicipio READ modelMunicipio CONSTANT)
Q_PROPERTY(bb::cascades::DataModel* modelProductoFiltro READ modelProductoFiltro CONSTANT)
Q_PROPERTY(bb::cascades::DataModel* modelTemporada READ modelTemporada CONSTANT)
Q_PROPERTY(bb::cascades::DataModel* modelSearchProducto READ modelSearchProducto CONSTANT)

public:
	ApplicationUI(QObject *parent = 0);

	// Converts the passed QString to an UTF-8 encoded QByteArray
	    Q_INVOKABLE QByteArray encodeQString(const QString& toEncode) const;



/*public slots:
    void handlePushButtonClicked();
    void handlePopTransitionEnded(bb::cascades::Page* page);*/



public Q_SLOTS:

	void requestCatProducto();

	void requestProducto(const QString &idCategoria);

	void requestMunicipio (const QString &idCategoria);

	void requestProductoFiltro(const QString &idMunicipio, const QString &idProducto, const QString &idEstablecimiento, const QString &idPresentacion);

	void requestTempCatProducto();

	void requestSearchProducto(const QString &idCategoria, const QString &txtSearch);

	void requestUserLogin(const QString &user, const QString &pw);


	// WEB SERVICE POST

	void postResgiter(const QString &nombre, const QString &apellido, const QString &genero, const QString &correo, const QString &pw);

	/*
	 * Allows the QML to reset the state of the application
	 */
	void reset();



Q_SIGNALS:


	/*
	 * This signal is emitted whenever the tweets have been loaded successfully
	 */
	void tweetsLoaded();

	/*
	 * The change notification signals of the properties
	 */
	void activeChanged();
	void statusChanged();

	//void onFinished(bb::system::SystemUiResult::Type type);

private Q_SLOTS:
	/*
	 * Handles the complete signal from TwitterRequest when
	 * the request is complete
	 * @see TwitterRequest::complete()
	 */
	void onTwitterTimeline(const QString &info, bool success, const QString &tipo);


private:
	/*
	 * Parses the JSON response from the twitter request
	 */
	void parseResponse(const QString&, const QString&);

	/*
	 * The accessor methods of the properties
	 */
	bool active() const;
	bool error() const;
	QString errorMessage() const;
	bb::cascades::DataModel* model() const;
	bb::cascades::DataModel* modelProducto() const;
	bb::cascades::DataModel* modelMunicipio() const;
	bb::cascades::DataModel* modelProductoFiltro() const;
	bb::cascades::DataModel* modelTemporada() const;
	bb::cascades::DataModel* modelSearchProducto() const;
	//QDeclarativePropertyMap* propertyMap() const;


private:


	bool m_active;
	bool m_error;
	QString m_errorMessage;
	bb::cascades::GroupDataModel* m_model;
	bb::cascades::GroupDataModel* m_modelProducto;
	bb::cascades::GroupDataModel* m_modelMunicipio;
	bb::cascades::GroupDataModel* m_modelProductoFiltro;
	bb::cascades::GroupDataModel* m_modelTemporada;
	bb::cascades::GroupDataModel* m_modelSearchProducto;


	QString pwHash;

	//const QString& idCuponV;

	//QDeclarativePropertyMap* m_propertyMap;
	bb::cascades::QmlDocument *qml;

	bb::cascades::AbstractPane *root;

	bb::cascades::NavigationPane *m_pane;

	bb::cascades::Page *m_page;


	/**
	 * This function initializes the content page
	 *
	 * @return The created content Page
	 */


	//CustomDialogAlarm *mAlarmDialog;

    /*NavigationPane* mRoot;
    Page* mNewPage;*/

	// The central object to manage invocations
	//bb::system::InvokeManager* m_invokeManager;
};
//! [0]

#endif
