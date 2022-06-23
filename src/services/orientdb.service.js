const connection = require('../database/database');

class OrientDB {

    constructor() { }

    async getGraph() {
        const result = { nodes: [], edges: [] };
        const professors = await getProfessor();
        const students = await getStudent();
        const courses = await getCourses();
        const studyR = await getStudyRelationship();
        const teachR = await getTeachRelationship();

        result.nodes.push(...professors, ...students, ...courses);
        result.edges.push(...studyR, ...teachR);
        return result;
    }
}

async function getProfessor() {
    let client = await connection.getSession();
    const resultDB = await client.select().from('Professor').all();

    const result = [];

    resultDB.forEach(element => {
        result.push(parseNode(element));
    });

    return result;
}

async function getStudent() {
    let client = await connection.getSession();
    const resultDB = await client.select().from('Student').all();
    const result = [];

    resultDB.forEach(element => {
        result.push(parseNode(element));
    });

    return result;
}

async function getCourses() {
    let client = await connection.getSession();
    const resultDB = await client.select().from('Course').all();
    const result = [];

    resultDB.forEach(element => {
        result.push(parseNode(element));
    });

    return result;
}

async function getStudyRelationship() {
    let client = await connection.getSession();
    const resultDB = await client.select().from('Study').all();
    const result = [];

    resultDB.forEach(element => {
        result.push(parseEdge(element));
    });

    return result;
}
async function getTeachRelationship() {
    let client = await connection.getSession();
    const resultDB = await client.select().from('Teach').all();
    const result = [];

    resultDB.forEach(element => {
        result.push(parseEdge(element));
    });

    return result;
}

function parseNode(record) {
    return { id: record['@rid'], label: record['name'] }
}

function parseEdge(record) {
    return { id: record['@rid'], label: record['@class'], from: record['out'], to: record['in'] };
}

module.exports = new OrientDB();