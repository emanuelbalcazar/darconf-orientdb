/**
 * Database connection module.
 */
const OrientDBClient = require("orientjs").OrientDBClient;

let session = null;

async function getSession() {
    if (!session) {
        let client = await OrientDBClient.connect({
            host: 'localhost',
            port: 2424
        });

        session = await client.session({ name: 'borrar', username: 'root', password: 'root', pool: { max: 10 } });
    }

    return session;
}

module.exports = {
    getSession: getSession
};