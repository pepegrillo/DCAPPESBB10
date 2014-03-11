/*
 * Copyright (c) 2011-2012 Research In Motion Limited.
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

#include "applicationui.hpp"
#include "TwitterRequest.hpp"
#include "WebImageView.h"

#include "ActiveFrameQML.hpp"

#include <bb/system/InvokeRequest>
#include <bb/system/CardDoneMessage>

#include <bb/cascades/AbstractPane>
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/ValidationMode>
#include <bb/cascades/Page>
#include <bb/cascades/Container>
#include <bb/cascades/ActionItem>
#include <bb/cascades/Container>
#include <bb/cascades/Color>
#include <bb/cascades/Container>
#include <bb/cascades/DockLayout>
#include <bb/cascades/Label>
#include <bb/cascades/ListView>
#include <bb/cascades/ImageView>
#include <bb/cascades/ImagePaint>
#include <bb/cascades/NavigationPane>
#include <bb/cascades/NavigationPaneProperties>
#include <bb/cascades/Page>
#include <bb/cascades/SceneCover>
#include <bb/cascades/StackLayout>
#include <bb/cascades/TextStyle>
#include <bb/cascades/OrientationSupport>
#include <bb/system/SystemToast>
#include <bb/cascades/Menu>
#include <bb/cascades/TextFieldInputMode>
#include <bb/cascades/DropDown>

#include <bb/system/SystemToast>
#include <bb/system/SystemDialog>
#include <bb/system/SystemUiResult>
#include <bb/system/SystemPrompt.hpp>
#include <bb/system/SystemUiInputField.hpp>
#include <bb/system/SystemUiInputMode.hpp>
#include <bb/system/SystemUiInputField>

#include <bb/data/JsonDataAccess>
#include <QDebug>
//#include <bb/system/SystemToast>

using namespace bb::cascades;
using namespace bb::system;
using namespace bb::data;

/*
 * This application demonstrates how to retrieve a twitter feed and populate a listview with StandardListItem
 * and a ListView with items from the json data. Also demonstrates how to parse json into a GroupDataModel
 */

/*
 * Default constructor
 */
//! [0]
ApplicationUI::ApplicationUI(QObject *parent)
    : QObject(parent)
    , m_active(false)
    , m_error(false)
    , m_model(new GroupDataModel(QStringList() << "idCategoria", this))
	, m_modelProducto(new GroupDataModel(QStringList() << "nombre", this))
	, m_modelMunicipio(new GroupDataModel(QStringList() << "municipio", this))
	, m_modelProductoFiltro(new GroupDataModel(QStringList() << "producto", this))
	, m_modelTemporada(new GroupDataModel(QStringList() << "idCategoria", this))
	, m_modelSearchProducto(new GroupDataModel(QStringList() << "nombre", this))
	//, m_propertyMap(new QDeclarativePropertyMap(this))
	/*, m_invokeManager(new InvokeManager(this))*/
{

	/*connect(m_invokeManager,
					SIGNAL(childCardDone(const bb::system::CardDoneMessage&)), this,
					SLOT(childCardDone(const bb::system::CardDoneMessage&)));
*/
    m_model->setGrouping(ItemGrouping::None);
    m_modelProducto->setGrouping(ItemGrouping::None);
    m_modelMunicipio->setGrouping(ItemGrouping::None);
    m_modelProductoFiltro->setGrouping(ItemGrouping::None);
    m_modelTemporada->setGrouping(ItemGrouping::None);
    m_modelSearchProducto->setGrouping(ItemGrouping::None);

    //m_property->parent();

    qmlRegisterType<WebImageView>("org.labsquare", 1, 0, "WebImageView");

    //QmlDocument* qml = QmlDocument::create("asset:///main.qml").parent(this);
    qml = QmlDocument::create("asset:///main.qml").parent(this);

    ActiveFrameQML *activeFrame = new ActiveFrameQML();
    Application::instance()->setCover(activeFrame);

    qml->setContextProperty("activeFrame", activeFrame);


    qml->setContextProperty("_timeline", this);


    root = qml->createRootObject<AbstractPane>();



    //DropDown *dropDown = root->findChild<DropDown>("myDropDown");

    /*myLabel = root->findChild<Label*>("lblRetrieve");
    myLabel->setText("Problem with the network");*/

    Application::instance()->setScene(root);
}
//! [0]

void ApplicationUI::postEstablecimiento(const QString &idlista, const QString &idestablecimiento, const QString &hashkey)
{

}

// A public function to display a SystemDialog in your UI
void ApplicationUI::showDialog(const QString &idlista, const QString &idestablecimiento, const QString &hashkey)
{

	SystemDialog *dialog = new SystemDialog();
		SystemUiButton *yesBtn = dialog->confirmButton();
		yesBtn->setLabel("Ok");
		SystemUiButton *noBtn = dialog->cancelButton();
		noBtn->setLabel(QString::null);
		dialog->setBody(idlista+" > "+idestablecimiento+" > "+hashkey);
		dialog->show();
		QObject::connect(dialog, SIGNAL(finished(bb::system::SystemUiResult::Type)), this,
				SLOT(onDialogFinished(bb::system::SystemUiResult::Type)));
}

void ApplicationUI::onDialogFinished(bb::system::SystemUiResult::Type type) {
	//2 : Yes Button result
	if (type == 2) {
		//bb::Application::instance()->exit(0);
		//qDebug() << idlista+" > "+idestablecimiento+" > "+hashkey;
	}
}


//! [1]
void ApplicationUI::reset()
{
    m_error = false;
    m_errorMessage.clear();

    emit statusChanged();
}


void ApplicationUI::requestCatProducto()
{
    if (m_active)
        return;


    TwitterRequest* request1 = new TwitterRequest(this);
    connect(request1, SIGNAL(complete(QString, bool, QString)), this, SLOT(onTwitterTimeline(QString, bool, QString)));
    request1->requestCatProducto();

    m_active = true;
    emit activeChanged();
}


void ApplicationUI::requestProducto(const QString &idCategoria)
{
    if (m_active)
        return;

    TwitterRequest* request2 = new TwitterRequest(this);
    connect(request2, SIGNAL(complete(QString, bool, QString)), this, SLOT(onTwitterTimeline(QString, bool, QString)));
    request2->requestProducto(idCategoria);

    m_active = true;
    emit activeChanged();
}


void ApplicationUI::requestMunicipio(const QString &idCategoria)
{
    if (m_active)
        return;

    TwitterRequest* request3 = new TwitterRequest(this);
    connect(request3, SIGNAL(complete(QString, bool, QString)), this, SLOT(onTwitterTimeline(QString, bool, QString)));
    request3->requestMunicipio(idCategoria);

    m_active = true;
    emit activeChanged();
}


void ApplicationUI::requestProductoFiltro(const QString &idMunicipio, const QString &idProducto, const QString &idEstablecimiento, const QString &idPresentacion)
{
    if (m_active)
        return;

    TwitterRequest* request4 = new TwitterRequest(this);
    connect(request4, SIGNAL(complete(QString, bool, QString)), this, SLOT(onTwitterTimeline(QString, bool, QString)));
    request4->requestProductoFiltro(idMunicipio,idProducto,idEstablecimiento,idPresentacion);

    m_active = true;
    emit activeChanged();
}

void ApplicationUI::requestTempCatProducto()
{
    if (m_active)
        return;


    TwitterRequest* request5 = new TwitterRequest(this);
    connect(request5, SIGNAL(complete(QString, bool, QString)), this, SLOT(onTwitterTimeline(QString, bool, QString)));
    request5->requestTempCatProducto();

    m_active = true;
    emit activeChanged();
}

void ApplicationUI::requestSearchProducto(const QString &idCategoria, const QString &txtSearch)
{
    if (m_active)
        return;


    TwitterRequest* request6 = new TwitterRequest(this);
    connect(request6, SIGNAL(complete(QString, bool, QString)), this, SLOT(onTwitterTimeline(QString, bool, QString)));
    request6->requestSearchProducto(idCategoria,txtSearch);

    m_active = true;
    emit activeChanged();
}

void ApplicationUI::requestUserLogin(const QString &user, const QString &pw)
{
	QCryptographicHash hash(QCryptographicHash::Sha1);
	hash.addData(pw.toUtf8());
	pwHash = QString(hash.result().toHex());

	qDebug() << "Usuario txt>"+user;
	qDebug() << "PASSWORD HASHEADO>"+pw+"<HOLA QUE HACE>"+pwHash;

    TwitterRequest* request7 = new TwitterRequest(this);
    connect(request7, SIGNAL(complete(QString, bool, QString)), this, SLOT(onTwitterTimeline(QString, bool, QString)));
    request7->requestUserLogin(user,pwHash);
}



// Web Service Post
//! [1]
void ApplicationUI::postResgiter(const QString &nombre, const QString &apellido, const QString &genero, const QString &correo, const QString &pw)
{
    if (m_active)
        return;

    TwitterRequest* requestPost1 = new TwitterRequest(this);
    //Aca es donde se arma el json� el identificador es el deltelefono, para cada post mira el cuerpo que tienen en el postman y asi lo tenes que armar.
    const QString quote = "\"";
    const QString body1 = ("{"+quote+"nombre"+quote+": "+quote+nombre+quote+
    						","+quote+"apellido"+quote+": "+quote+apellido+quote+
    						","+quote+"sexo"+quote+": "+quote+genero+quote+
    						","+quote+"correo"+quote+": "+quote+correo+quote+
    						","+quote+"clave"+quote+": "+quote+pw+quote+"}");
    connect(requestPost1, SIGNAL(complete(QString, bool, QString)), this, SLOT(onTwitterTimeline(QString, bool, QString)));
    requestPost1->postResgiter(body1);
    qDebug() << "PRUEBA JSON POST USUARIO REGISTRADO " + body1;

    m_active = true;
    emit activeChanged();
}
//! [1]

/*
 * App::onTwitterTimeline(const QString &info, bool success)
 *
 * Slot handler for receiving the data from the twitter network request
 * made in App::getTimeline(). On success it navigates to the appropriate
 * ListView and on failure it displays the error string from the failed
 * request.
 *
 * info - contains the json response (success) or error text (failure)
 * success - boolean flag indicating success of failure of the request
 */
//! [3]
void ApplicationUI::onTwitterTimeline(const QString &info, bool success, const QString &tipo)
{
    TwitterRequest *request = qobject_cast<TwitterRequest*>(sender());

    if (success) {
        parseResponse(info, tipo);

        emit tweetsLoaded();
    } else {
        m_errorMessage = info;
        m_error = true;
        emit statusChanged();
    }

    m_active = false;
    emit activeChanged();

    request->deleteLater();
}
//! [3]


/*
 * App::parseResponse()
 *
 * Parses the JSON data from the twitter response and populates the ListView.
 */
//! [4]
void ApplicationUI::parseResponse(const QString &response, const QString &tipo)
{
    m_model->clear();
    m_modelProducto->clear();
    m_modelMunicipio->clear();
    m_modelProductoFiltro->clear();
    m_modelSearchProducto->clear();

    if (response.trimmed().isEmpty())
        return;

    qDebug() << "PRUEBA JSON "+response;

    qDebug() << tipo;



    // Parse the json response with JsonDataAccess
    JsonDataAccess dataAccess;
    const QVariantMap variant = dataAccess.loadFromBuffer(response).toMap();
    const QVariantMap categorias = variant["response"].toMap();
    QString tipoCodigoId   = categorias["errorCode"].value<QString>();
    //qDebug() << "========== "+variant["response"].toList();

    if (tipo == "categoriaproducto") {

    	//Obtenemos el Estado de la consulta


		if (tipoCodigoId == "0"){

			const QVariantList categorias2 = categorias["msg"].toList();

			foreach (const QVariant &msg, categorias2) {
				m_model->insert(msg.toMap());
				//qDebug() << "FEED "+msg.toString()+"\r";
			}
			QDeclarativePropertyMap* propertyMap = new QDeclarativePropertyMap;
			propertyMap->insert("mensaje", QVariant(QString("")));
			qml->setContextProperty("MensajeInfo", propertyMap);

		}else{

			QDeclarativePropertyMap* propertyMap = new QDeclarativePropertyMap;
			propertyMap->insert("mensaje", QVariant("No se ha obtenido ningún dato"));

			qml->setContextProperty("MensajeInfo", propertyMap);
		}
    }else if (tipo == "producto"){

    	if (tipoCodigoId == "0"){

    		const QVariantList categorias2 = categorias["msg"].toList();

			foreach (const QVariant &msg, categorias2) {
				m_modelProducto->insert(msg.toMap());
				//qDebug() << "FEED "+msg.toString()+"\r";
			}
			QDeclarativePropertyMap* propertyMap = new QDeclarativePropertyMap;
			propertyMap->insert("mensaje", QVariant(QString("")));
			qml->setContextProperty("MensajeInfo", propertyMap);

    	}else{

			QDeclarativePropertyMap* propertyMap = new QDeclarativePropertyMap;
			propertyMap->insert("mensaje", QVariant("No se ha obtenido ningun dato"));

			qml->setContextProperty("MensajeInfo", propertyMap);
		}
    }else if (tipo == "filtromunicipio"){

    	if (tipoCodigoId == "0"){

    		const QVariantList categorias2 = categorias["msg"].toList();

			foreach (const QVariant &msg, categorias2) {
				m_modelMunicipio->insert(msg.toMap());
				//qDebug() << "FEED "+msg.toString()+"\r";
			}
			QDeclarativePropertyMap* propertyMap = new QDeclarativePropertyMap;
			propertyMap->insert("mensaje", QVariant(QString("")));
			qml->setContextProperty("MensajeInfo", propertyMap);

    	}else{

			QDeclarativePropertyMap* propertyMap = new QDeclarativePropertyMap;
			propertyMap->insert("mensaje", QVariant("No se ha obtenido ningun dato"));

			qml->setContextProperty("MensajeInfo", propertyMap);
		}
    }else if (tipo == "productofiltro"){

    	if (tipoCodigoId == "0"){

    		const QVariantList categorias2 = categorias["msg"].toList();

			foreach (const QVariant &msg, categorias2) {
				m_modelProductoFiltro->insert(msg.toMap());
				//qDebug() << "FEED "+msg.toString()+"\r";
			}
			QDeclarativePropertyMap* propertyMap = new QDeclarativePropertyMap;
			propertyMap->insert("mensaje", QVariant(QString("")));
			qml->setContextProperty("MensajeInfo", propertyMap);

    	}else{

			QDeclarativePropertyMap* propertyMap = new QDeclarativePropertyMap;
			propertyMap->insert("mensaje", QVariant("No se ha obtenido ningun dato"));

			qml->setContextProperty("MensajeInfo", propertyMap);
		}
    }else if (tipo == "temporadacategoriaproducto"){

    	if (tipoCodigoId == "0"){

    		const QVariantList categorias2 = categorias["msg"].toList();

			foreach (const QVariant &msg, categorias2) {
				m_modelTemporada->insert(msg.toMap());
				//qDebug() << "FEED "+msg.toString()+"\r";
			}
			QDeclarativePropertyMap* propertyMap = new QDeclarativePropertyMap;
			propertyMap->insert("mensaje", QVariant(QString("")));
			qml->setContextProperty("MensajeInfo", propertyMap);

    	}else{

			QDeclarativePropertyMap* propertyMap = new QDeclarativePropertyMap;
			propertyMap->insert("mensaje", QVariant("No se ha obtenido ningun dato"));

			qml->setContextProperty("MensajeInfo", propertyMap);
		}
    }else if (tipo == "searchproducto"){

    	if (tipoCodigoId == "0"){

    		const QVariantList categorias2 = categorias["msg"].toList();

			foreach (const QVariant &msg, categorias2) {
				m_modelSearchProducto->insert(msg.toMap());
				//qDebug() << "FEED "+msg.toString()+"\r";
			}
			QDeclarativePropertyMap* propertyMap = new QDeclarativePropertyMap;
			propertyMap->insert("mensaje", QVariant(QString("")));
			qml->setContextProperty("MensajeInfo", propertyMap);

    	}else{

			QDeclarativePropertyMap* propertyMap = new QDeclarativePropertyMap;
			propertyMap->insert("mensaje", QVariant("No se ha obtenido ningun dato"));

			qml->setContextProperty("MensajeInfo", propertyMap);
		}
    }else if (tipo == "userlogin"){






    }else{

		SystemToast *toast = new SystemToast(this);

		toast->setBody("Usuario y/o contraseña incorrecto");
		toast->setPosition(SystemUiPosition::MiddleCenter);
		toast->show();
		qDebug() << "No existe este usuario de Mi vida>";
	}
}



bool ApplicationUI::active() const
{
    return m_active;
}

bool ApplicationUI::error() const
{
    return m_error;
}

QString ApplicationUI::errorMessage() const
{
    return m_errorMessage;
}

bb::cascades::DataModel* ApplicationUI::model() const
{
    return m_model;
}

bb::cascades::DataModel* ApplicationUI::modelProducto() const
{
    return m_modelProducto;
}

bb::cascades::DataModel* ApplicationUI::modelMunicipio() const
{
    return m_modelMunicipio;
}

bb::cascades::DataModel* ApplicationUI::modelProductoFiltro() const
{
    return m_modelProductoFiltro;
}

bb::cascades::DataModel* ApplicationUI::modelTemporada() const
{
    return m_modelTemporada;
}

bb::cascades::DataModel* ApplicationUI::modelSearchProducto() const
{
    return m_modelSearchProducto;
}


QByteArray ApplicationUI::encodeQString(const QString& toEncode) const {
	return toEncode.toUtf8();
}

//! [1]

