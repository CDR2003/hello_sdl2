import std.stdio;
import derelict.sdl2.sdl;

void main()
{
	DerelictSDL2.load();

	if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_TIMER) < 0)
	{
		writefln("SDL couldn't initialize! SDL_Error: %s", SDL_GetError());
		return;
	}

	auto window = SDL_CreateWindow("SDL Tutorial", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 480, SDL_WindowFlags.SDL_WINDOW_SHOWN);
	if (window == null)
	{
		writefln("Create window failed! SDL_Error: %s", SDL_GetError());
		return;
	}

	auto surface = SDL_GetWindowSurface(window);
	SDL_FillRect(surface, null, SDL_MapRGB(surface.format, 0xff, 0xff, 0xff));
	SDL_UpdateWindowSurface(window);
	SDL_Delay(2000);
	
	SDL_DestroyWindow(window);
	SDL_Quit();
}
