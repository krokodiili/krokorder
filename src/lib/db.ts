import knex from 'knex';

export const pg = knex({
	client: 'pg',
	connection: {
		host: '127.0.0.1',
		port: 5432,
		user: 'postgres',
		password: 'jeejee123',
		database: 'resta'
	},
	searchPath: ['knex', 'public']
});
