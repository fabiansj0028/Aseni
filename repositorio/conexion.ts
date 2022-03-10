import * as sql from "mssql";

export const dbsettings = {
    user:'sa',
    password: '1234',
    server: 'localhost',
    database: 'Aseni',
    options:{
        encrypt: true,
        trustServerCertificate: true
    }
};

export const getConnection = async () => {
    try {
      const pool = await sql.connect(dbsettings);
      return pool;
    } catch (error) {
      console.error(error);
    }
  };

export {sql}