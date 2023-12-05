create table if not exists Genres(
	GenreID serial primary key,
	GenreName varchar not null
);

create table if not exists Artists(
	ArtistID serial primary key,
	ArtistName varchar not null
);

create table if not exists Albums(
	AlbumID serial primary key,
	AlbumName varchar not null,
	ReleaseYear int not null
);

create table if not exists Tracks(
	TrackID serial primary key,
	TrackName varchar not null,
	Duration int not null,
	AlbumID serial references Albums(AlbumID)
);

create table if not exists Compilations(
	CompilationID serial primary key,
	CompilationName varchar not null,
	ReleaseYear int not null
);

create table if not exists ArtistGenres(
	GenreID serial references Genres(GenreID),
	ArtistID serial references Artists(ArtistID),
	constraint AG primary key(GenreID, ArtistID)
);

create table if not exists AlbumArtists(
	AlbumID serial references Albums(AlbumID),
	ArtistID serial references Artists(ArtistID),
	constraint AA primary key(AlbumID, ArtistID)
);

create table if not exists CompilationTracks(
	CompilationID serial references Compilations(CompilationID),
	TrackID serial references Tracks(TrackID),
	constraint CT primary key(CompilationID, TrackID)
);