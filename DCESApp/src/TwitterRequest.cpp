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

#include "TwitterRequest.hpp"

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QUrl>

/*
 * Default constructor
 */
TwitterRequest::TwitterRequest(QObject *parent)
    : QObject(parent)
{
}

/*
 * TwitterRequest::requestTimeline(const QString &screenName)
 *
 * Makes a network call to retrieve the twitter feed for the specified screenname
 */

//! [0]
void TwitterRequest::requestCatProducto()
{
    QNetworkAccessManager* networkAccessManager1 = new QNetworkAccessManager(this);

    //const QString queryUri5 = QString::fromLatin1("http://galerias.buzzcoapp.com/GaleriasApiREST/v1/categories/8")/*.arg(screenName)*/;
    const QString queryUri1 = QString::fromLatin1("http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getCategorias");

    QNetworkRequest request1(queryUri1);

    QNetworkReply* reply1 = networkAccessManager1->get(request1);

    tipoconsumo = "categoriaproducto";

    connect(reply1, SIGNAL(finished()), this, SLOT(onTimelineReply()));
}
//! [0]


//! [1]
void TwitterRequest::requestProducto(const QString &idCategoria)
{
    QNetworkAccessManager* networkAccessManager2 = new QNetworkAccessManager(this);

    const QString queryUri2 = QString::fromLatin1("http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getListaDeProductosPorCategoria/").append(idCategoria);

    QNetworkRequest request2(queryUri2);

    QNetworkReply* reply2 = networkAccessManager2->get(request2);

    tipoconsumo = "producto";

    connect(reply2, SIGNAL(finished()), this, SLOT(onTimelineReply()));
}
//! [1]


//! [2]
void TwitterRequest::requestMunicipio(const QString &idCategoria)
{
    QNetworkAccessManager* networkAccessManager3 = new QNetworkAccessManager(this);

    const QString queryUri3 = QString::fromLatin1("http://observatoriodeprecios.defensoria.gob.sv/v1/getFiltroMunicipios/").append(idCategoria+"/");

    QNetworkRequest request3(queryUri3);

    QNetworkReply* reply3 = networkAccessManager3->get(request3);

    tipoconsumo = "filtromunicipio";

    connect(reply3, SIGNAL(finished()), this, SLOT(onTimelineReply()));
}
//! [2]


//! [3]
void TwitterRequest::requestProductoFiltro(const QString &idMunicipio, const QString &idProducto, const QString &idEstablecimiento, const QString &idPresentacion)
{
    QNetworkAccessManager* networkAccessManager4 = new QNetworkAccessManager(this);

    const QString queryUri4 = QString::fromLatin1("http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getListaDeProductosFiltro/").append(idMunicipio+"/"+idProducto+"/"+idEstablecimiento+"/"+idPresentacion);

    QNetworkRequest request4(queryUri4);

    QNetworkReply* reply4= networkAccessManager4->get(request4);

    tipoconsumo = "productofiltro";

    connect(reply4, SIGNAL(finished()), this, SLOT(onTimelineReply()));
}
//! [3]


/*
 * TwitterRequest::onTimelineReply()
 *
 * Callback handler for QNetworkReply finished() signal
 */
//! [1]
void TwitterRequest::onTimelineReply()
{
    QNetworkReply* reply = qobject_cast<QNetworkReply*>(sender());

    QString response;
    bool success = false;
    if (reply) {
        if (reply->error() == QNetworkReply::NoError) {
            const int available = reply->bytesAvailable();
            if (available > 0) {
                const QByteArray buffer = reply->readAll();
                response = QString::fromUtf8(buffer);
                success = true;
            }
        } else {
            response =  tr("Error: %1 status: %2").arg(reply->errorString(), reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toString());
        }

        reply->deleteLater();
    }

    if (response.trimmed().isEmpty()) {
        response = tr("Twitter request failed. Check internet connection");
    }

    emit complete(response, success, tipoconsumo);
}
//! [1]
